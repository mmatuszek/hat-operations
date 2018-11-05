package com.hat.service.domain.operations;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Objects;
import java.util.UUID;

public class Operation {

  private final String id;
  private final String type;
  private final String description;
  private final BigDecimal amount;
  private final LocalDate localDate;

  public Operation(String type, String description, BigDecimal amount, LocalDate localDate) {
    this.id = UUID.randomUUID().toString();
    this.type = type;
    this.description = description;
    this.amount = amount;
    this.localDate = localDate;
  }

  public String getId() {
    return id;
  }

  public String getType() {
    return type;
  }

  public String getDescription() {
    return description;
  }

  public BigDecimal getAmount() {
    return amount;
  }

  public LocalDate getLocalDate() {
    return localDate;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Operation operation = (Operation) o;
    return Objects.equals(id, operation.id) &&
        Objects.equals(type, operation.type) &&
        Objects.equals(description, operation.description) &&
        Objects.equals(amount, operation.amount) &&
        Objects.equals(localDate, operation.localDate);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, type, description, amount, localDate);
  }

  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder("Operation{");
    sb.append("id='").append(id).append('\'');
    sb.append(", type='").append(type).append('\'');
    sb.append(", description='").append(description).append('\'');
    sb.append(", amount=").append(amount);
    sb.append(", localDate=").append(localDate);
    sb.append('}');
    return sb.toString();
  }
}
