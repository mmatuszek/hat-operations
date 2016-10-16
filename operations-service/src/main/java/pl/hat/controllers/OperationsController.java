package pl.hat.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pl.hat.dto.IncomeOperationDto;

@RestController("/operations")
public class OperationsController {

    @RequestMapping("/income")
    public IncomeOperationDto create(IncomeOperationDto operation) {
        return null;
    }
}
