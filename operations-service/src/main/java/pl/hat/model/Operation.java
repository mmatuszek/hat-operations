package pl.hat.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public abstract class Operation {

    private final long id;
    private LocalDate date;
    private String description;
    private BigDecimal amount;
    private int plannedOperationId;

    protected Operation() {
        this.id = -1;
    }

    protected Operation(long id) {
        this.id = id;
    }

    public final long getId() {
        return id;
    }

    public final LocalDate getDate() {
        return date;
    }

    public final String getDescription() {
        return description;
    }

    public final BigDecimal getAmount() {
        return amount;
    }

    public int getPlannedOperationId() {
        return plannedOperationId;
    }

}
