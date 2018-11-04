package com.hat.service.domain.operations;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Objects;

public class OperationDto {

    private final String id;
    private final String type;
    private final LocalDate operationDate;
    private final String description;
    private final BigDecimal amount;

    public OperationDto(String type, LocalDate operationDate, String description, BigDecimal amount) {
        this(null, type, operationDate, description, amount);
    }

    public OperationDto(String id, String type, LocalDate operationDate, String description, BigDecimal amount) {
        this.id = id;
        this.type = type;
        this.operationDate = operationDate;
        this.description = description;
        this.amount = amount;
    }

    public String getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public LocalDate getOperationDate() {
        return operationDate;
    }

    public String getDescription() {
        return description;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        OperationDto that = (OperationDto) o;
        return Objects.equals(id, that.id) &&
            Objects.equals(type, that.type) &&
            Objects.equals(operationDate, that.operationDate) &&
            Objects.equals(description, that.description) &&
            Objects.equals(amount, that.amount);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, type, operationDate, description, amount);
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("OperationDto{");
        sb.append("id='").append(id).append('\'');
        sb.append(", type='").append(type).append('\'');
        sb.append(", operationDate=").append(operationDate);
        sb.append(", description='").append(description).append('\'');
        sb.append(", amount=").append(amount);
        sb.append('}');
        return sb.toString();
    }
}
