package com.hat.service.domain.operations

import spock.lang.Specification

import java.time.LocalDate

class AddOperationServiceTest extends Specification {

    def repository = Mock(OperationsRepository)
    def serviceInTest = new AddOperationService(repository)

    def "should save operation"() {

        given: "test operation details"
        def type = "income"
        def description = "some generic description"
        def amount = new BigDecimal(15.29)
        def date = LocalDate.of(2019, 01, 31)

        when: "new operation is created"
        OperationDto operationDto = serviceInTest.addOperation(new OperationDto(type, date, description, amount))

        then: "operation is saved"
        1 * repository.persist(_) >> { arguments ->
            def operation = arguments[0] as Operation
            operation.description == description
            operation.amount == amount
            operation.type == type
            operation.localDate == date
        }

        and: "operation contains id"
        operationDto.getId() != null
    }
}
