package pl.hat.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pl.hat.dto.operation.IncomeOperationDto;
import pl.hat.dto.operation.NewIncomeOperationDto;

@RestController("/operations/income")
public class IncomeOperationsController {

    private OperationService operationService;

    public IncomeOperationsController(OperationService operationService) {
        this.operationService = operationService;
    }

    @Post
    public IncomeOperationDto create(NewIncomeOperationDto operation) {
        return null;
    }
}
