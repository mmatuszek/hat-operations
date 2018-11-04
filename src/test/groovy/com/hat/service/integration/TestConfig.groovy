package com.hat.service.integration

import com.hat.service.domain.operations.AddOperationService
import org.springframework.boot.test.context.TestConfiguration
import org.springframework.context.annotation.Bean
import spock.mock.DetachedMockFactory

@TestConfiguration
class TestConfig {

    DetachedMockFactory factory = new DetachedMockFactory()

    @Bean
    AddOperationService addOperationService() {
        factory.Mock(AddOperationService)
    }
}
