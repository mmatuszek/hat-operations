package pl.hat.model;

import java.math.BigDecimal;
import java.time.YearMonth;

public abstract class PlannedOperation {

    private final long id;
    private YearMonth month;
    private BigDecimal amount;
    private String description;

    protected PlannedOperation() {
        this.id = -1;
    }

    protected PlannedOperation(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public YearMonth getMonth() {
        return month;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public String getDescription() {
        return description;
    }
}
