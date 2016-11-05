package pl.hat.dto.operation;

import java.math.BigDecimal;
import java.net.URL;
import java.time.LocalDate;

public abstract class OperationDto {

    private final URL link;
    private final LocalDate date;
    private final String description;
    private final BigDecimal amount;

    public OperationDto(URL link, LocalDate date, String description, BigDecimal amount) {
        this.link = link;
        this.date = date;
        this.description = description;
        this.amount = amount;
    }

    public URL getLink() {
        return link;
    }

    public LocalDate getDate() {
        return date;
    }

    public String getDescription() {
        return description;
    }

    public BigDecimal getAmount() {
        return amount;
    }
}
