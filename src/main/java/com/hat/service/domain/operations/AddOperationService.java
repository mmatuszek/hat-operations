package com.hat.service.domain.operations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AddOperationService {

  private final OperationsRepository repository;

  @Autowired
  public AddOperationService(OperationsRepository repository) {
    this.repository = repository;
  }

  public OperationDto addOperation(OperationDto operation) {
    Operation operationEntity = new Operation(operation.getType(), operation.getDescription(),
        operation.getAmount(), operation.getOperationDate());
    repository.persist(operationEntity);
    return new OperationDto(operationEntity.getId(), operationEntity.getType(), operationEntity.getLocalDate(),
        operationEntity.getDescription(), operationEntity.getAmount());
  }
}
