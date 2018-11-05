package com.hat.service.integration.controllers.operations;

import com.hat.service.domain.operations.OperationDto;
import java.math.BigDecimal;
import org.springframework.hateoas.ResourceSupport;

class OperationResponse extends ResourceSupport {

  private final String id;
  private final String type;
  private final String date;
  private final String description;
  private final BigDecimal amount;

  public OperationResponse() {
    this.id = "";
    this.type = "";
    this.date = "";
    this.description = "";
    this.amount = null;
  }

  public OperationResponse(OperationDto operationDto) {
    this.id = operationDto.getId();
    this.type = operationDto.getType();
    this.date = operationDto.getOperationDate().toString();
    this.description = operationDto.getDescription();
    this.amount = operationDto.getAmount();
  }

  public String getOperationId() {
    return id;
  }

  public String getType() {
    return type;
  }

  public String getDate() {
    return date;
  }

  public String getDescription() {
    return description;
  }

  public BigDecimal getAmount() {
    return amount;
  }
}
