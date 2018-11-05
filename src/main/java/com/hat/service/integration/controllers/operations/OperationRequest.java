package com.hat.service.integration.controllers.operations;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.math.BigDecimal;
import java.time.LocalDate;

class OperationRequest {

  private final String type;
  private final String operationDate;
  private final String description;
  private final BigDecimal amount;

  @JsonCreator
  public OperationRequest(@JsonProperty("type") String type, @JsonProperty("date") String operationDate,
      @JsonProperty("description") String description, @JsonProperty("amount") BigDecimal amount) {
    this.type = type;
    this.operationDate = operationDate;
    this.description = description;
    this.amount = amount;
  }

  public String getType() {
    return type;
  }

  public String getOperationDate() {
    return operationDate;
  }

  public String getDescription() {
    return description;
  }

  public BigDecimal getAmount() {
    return amount;
  }
}
