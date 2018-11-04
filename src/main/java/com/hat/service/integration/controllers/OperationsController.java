package com.hat.service.integration.controllers;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;

import com.hat.service.domain.operations.AddOperationService;
import com.hat.service.domain.operations.OperationDto;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/operations")
class OperationsController {

  @Autowired
  AddOperationService operationService;

  @PostMapping
  @ResponseBody
  OperationResponse addOperation(@RequestBody OperationRequest request) {
    OperationDto createdOperation = operationService.addOperation(
        new OperationDto(request.getType(), LocalDate.parse(request.getOperationDate()), request.getDescription(), request.getAmount()));
    OperationResponse response = new OperationResponse(createdOperation);
    response.add(linkTo(OperationsController.class).slash(response.getOperationId()).withSelfRel());
    return response;
  }

}
