package pl.hat.dto;

import java.math.BigDecimal;
import java.net.URL;
import java.time.YearMonth;

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
