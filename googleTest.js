const { Builder, By, until } = require("selenium-webdriver");
const chrome = require("selenium-webdriver/chrome");

(async function example() {
  let options = new chrome.Options();
  options.addArguments("--headless");
  options.addArguments("--no-sandbox");
  options.addArguments("--disable-dev-shm-usage");
  options.addArguments("--disable-gpu");

  let driver = await new Builder()
    .forBrowser("chrome")
    .setChromeOptions(options)
    .build();

  try {
    await driver.get("https://www.google.com");
    await driver.wait(until.elementLocated(By.name("q")), 5000);
    console.log("Test Passed! Title:", await driver.getTitle());
  } finally {
    await driver.quit();
  }
})();
