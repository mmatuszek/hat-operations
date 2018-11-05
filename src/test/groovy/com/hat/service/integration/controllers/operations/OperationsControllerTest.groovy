package com.hat.service.integration.controllers.operations

import com.hat.service.domain.operations.AddOperationService
import com.hat.service.domain.operations.OperationDto
import com.hat.service.integration.TestConfig
import groovy.json.JsonSlurper
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.context.annotation.Import
import org.springframework.http.HttpHeaders
import org.springframework.http.HttpStatus
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.MvcResult
import spock.lang.Specification

import java.time.LocalDate

import static java.util.UUID.randomUUID
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post

@Import([TestConfig])
@SpringBootTest
@AutoConfigureMockMvc
class OperationsControllerTest extends Specification {

    @Autowired
    MockMvc mockMvc

    @Autowired
    AddOperationService operationService

    def "should create new income operation and return operation details"() {

        given: "add operation details"
        def id = randomUUID().toString()
        def type = "income"
        def date = "2018-10-19"
        def description = "Some test description"
        def amount = 12.59
        def input = new OperationDto(type, LocalDate.parse(date), description, amount)
        def output = new OperationDto(id, type, LocalDate.parse(date), description, amount)
        operationService.addOperation(input) >> { output }

        when: "request is sent"
        MvcResult result = mockMvc.perform(
                post("/operations")
                        .header(HttpHeaders.CONTENT_TYPE, "application/json")
                        .content("{" +
                        "\"type\":\"${type}\"," +
                        "\"date\":\"${date}\"," +
                        "\"description\":\"${description}\"," +
                        "\"amount\":${amount}" +
                        "}"))
                .andReturn()

        then: "response is successful"
        result.getResponse().getStatus() == HttpStatus.OK.value()

        and: "response contains operation details"
        def responseJson = new JsonSlurper().parseText(result.response.contentAsString) as Map
        verifyAll {
            responseJson.operationId == id
            responseJson.type == type
            responseJson.description == description
            responseJson.date == date
            responseJson.amount == amount
            responseJson.links
        }

        and: "response contains URL to operation details"
        def linkList = responseJson.links as List
        def link = linkList[0] as Map
        link.rel == "self"
        link.href == "http://localhost/operations/${id}"
    }
}
