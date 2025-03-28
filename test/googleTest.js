const { Builder, By, until } = require("selenium-webdriver");

(async function () {
  const driver = await new Builder()
    .forBrowser("chrome")
    .setChromeOptions({
      args: ["--headless", "--no-sandbox", "--disable-dev-shm-usage"],
    })
    .build();

  try {
    await driver.get("https://www.google.com");
    await driver.wait(until.titleContains("Google"), 5000);
    console.log("Test Passed! Title:", await driver.getTitle());
  } finally {
    await driver.quit();
  }
})();
