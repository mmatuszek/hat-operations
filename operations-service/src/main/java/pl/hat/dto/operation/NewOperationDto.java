package pl.hat.dto.operation;

import java.math.BigDecimal;
import java.time.LocalDate;

public class NewOperationDto {

	private final LocalDate date;
	private final String description;
	private final BigDecimal amount;

	public NewOperationDto(LocalDate date, String description, BigDecimal amount) {
		this.date = date;
		this.description = description;
		this.amount = amount;
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
