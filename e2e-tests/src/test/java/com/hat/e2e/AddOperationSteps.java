package com.hat.e2e;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.embedded.LocalServerPort;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.hat.e2e.pageobjects.HomePage;
import com.hat.e2e.pageobjects.LoginPage;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import pl.hat.ui.Application;

@ContextConfiguration(classes = {Application.class})
@SpringBootTest(classes = {Application.class}, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class AddOperationSteps {

	private static final String HOME_URL_TEMPLATE = "http://localhost:%s/";

	private static final Logger log = Logger.getLogger(AddOperationSteps.class);

	@LocalServerPort
	int port;

	@Autowired
	private TestRestTemplate restTemplate;

	private String hatUrl;

	private WebDriver webDriver = new HtmlUnitDriver();

	@Given("^test environment is running")
	public void testEnvironmentIsRunning() throws Throwable {
		this.hatUrl = String.format(HOME_URL_TEMPLATE, port);
	}

	@And("^user logs in to application$")
	public void userLogsInToApplication() throws Throwable {
		webDriver.get(hatUrl);
		new LoginPage(webDriver).typeUsername("admin").typePassword("password123").submitLogin();
	}

	@And("^user opens a page to create operation$")
	public void userOpensAPageToCreateOperation() throws Throwable {
		WebElement addOperationButton = webDriver.findElement(By.id("hat-add-operation-button"));
		addOperationButton.click();
	}

	@When("^(.+), (.+), (.+), (.+), (.+), (.+) is entered by user$")
	public void incomeOperationIsEntered(String date, String type, String category, String targetAccount, String description, String amount) {
		WebElement dateField = webDriver.findElement(By.id("hat-operation-date"));
		WebElement typeField = webDriver.findElement(By.id("hat-operation-type"));
		WebElement categoryField = webDriver.findElement(By.id("hat-operation-category"));
		WebElement accountField = webDriver.findElement(By.id("hat-target-account"));
		WebElement descriptionField = webDriver.findElement(By.id("hat-description"));
		WebElement amountField = webDriver.findElement(By.id("hat-amount"));
		WebElement saveOperationField = webDriver.findElement(By.id("hat-save-operation"));
		dateField.sendKeys(date);
		typeField.sendKeys(type);
		categoryField.sendKeys(category);
		accountField.sendKeys(targetAccount);
		descriptionField.sendKeys(description);
		amountField.sendKeys(amount);
		saveOperationField.click();
	}

	@Then("^save confirmation is displayed$")
	public void saveConfirmationIsDisplayed() throws Throwable {
		webDriver.findElement(By.id("hat-success-alert"));
	}

	@When("^user clicks search button$")
	public void userClicksSearchButton() throws Throwable {
		WebElement searchOperationsButton = webDriver.findElement(By.id("hat-search"));
		searchOperationsButton.click();
	}

	@Then("^(.+), (.+), (.+), (.+) is visible in search$")
	public void dateTypeDescriptionAmountIsVisibleInSearch(String date, String type, String description, String amount) throws Throwable {
		List<WebElement> searchResults = webDriver.findElements(By.className("hat-operation-search-result"));
		int numberOfOperationsFound = 0;
		for (WebElement searchResult : searchResults) {
			WebElement dateField = searchResult.findElement(By.className("hat-operation-search-result-date"));
			WebElement typeField = searchResult.findElement(By.className("hat-operation-search-result-type"));
			WebElement descriptionField = searchResult.findElement(By.className("hat-operation-search-result-description"));
			WebElement amountField = searchResult.findElement(By.className("hat-operation-search-result-amount"));
			String foundDate = dateField.getText();
			String foundType = typeField.getText();
			String foundDescription = descriptionField.getText();
			String foundAmount = amountField.getText();
			if (foundDate.equals(date) && foundType.equals(type) && foundDescription.equals(description) && foundAmount.equals(amount)) {
				numberOfOperationsFound++;
			}
		}
		assertEquals("Invalid number of operations found", 1, numberOfOperationsFound);
	}

	@After
	public void tearDown(Scenario scenario) {
		if (scenario.isFailed()) {
			log.info(webDriver.getPageSource());
		}
		webDriver.close();
	}
}
