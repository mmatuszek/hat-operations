package pl.hat.dto;

import java.math.BigDecimal;
import java.net.URL;
import java.time.YearMonth;

public abstract class PlannedOperationDto {

    private final URL link;
    private YearMonth month;
    private BigDecimal amount;
    private String description;

    public PlannedOperationDto(URL link, YearMonth month, BigDecimal amount, String description) {
        this.link = link;
        this.month = month;
        this.amount = amount;
        this.description = description;
    }

    public URL getLink() {
        return link;
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
