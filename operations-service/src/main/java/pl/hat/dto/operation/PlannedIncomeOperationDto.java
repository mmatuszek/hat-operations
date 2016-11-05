package pl.hat.dto.operation;

import java.math.BigDecimal;
import java.net.URL;
import java.time.YearMonth;

import pl.hat.dto.CategoryDto;

public final class PlannedIncomeOperationDto extends PlannedOperationDto {

    private CategoryDto category;

    public PlannedIncomeOperationDto(URL link, YearMonth month, BigDecimal amount, String description, CategoryDto category) {
        super(link, month, amount, description);
        this.category = category;
    }

    public CategoryDto getCategory() {
        return category;
    }
}
