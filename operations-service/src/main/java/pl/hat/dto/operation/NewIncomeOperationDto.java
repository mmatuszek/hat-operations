package pl.hat.dto.operation;

import java.math.BigDecimal;
import java.time.LocalDate;

public final class NewIncomeOperationDto extends NewOperationDto {

	private final int accountId;
	private final int categoryId;
	private final String plannedIncomeOperationId;

	public NewIncomeOperationDto(String id, LocalDate date, String description, BigDecimal amount, int accountId, int categoryId, String plannedIncomeOperationId) {
		super(id, date, description, amount);
		this.accountId = accountId;
		this.categoryId = categoryId;
		this.plannedIncomeOperationId = plannedIncomeOperationId;
	}

	public int getAccountId() {
		return accountId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public String getPlannedIncomeOperationId() {
		return plannedIncomeOperationId;
	}
}
