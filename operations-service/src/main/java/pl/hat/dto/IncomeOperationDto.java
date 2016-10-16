package pl.hat.dto;

import java.math.BigDecimal;
import java.net.URL;
import java.time.LocalDate;

public final class IncomeOperationDto extends OperationDto {

    private final AccountDto sourceAccount;
    private final CategoryDto category;
    private final PlannedIncomeOperationDto plannedOperation;

    public IncomeOperationDto(URL link, LocalDate date, String description, BigDecimal amount, AccountDto sourceAccount, CategoryDto category, PlannedIncomeOperationDto plannedOperation) {
        super(link, date, description, amount);
        this.sourceAccount = sourceAccount;
        this.category = category;
        this.plannedOperation = plannedOperation;
    }

    public AccountDto getSourceAccount() {
        return sourceAccount;
    }

    public CategoryDto getCategory() {
        return category;
    }

    public PlannedIncomeOperationDto getPlannedOperation() {
        return plannedOperation;
    }
}
