#!/usr/bin/env python

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from flask import Flask
app = Flask(__name__)


def check_browser(browser):
  driver = webdriver.Remote(
    # command_executor='http://selenium-hub:4444/wd/hub',
    # command_executor='http://localhost:4444/wd/hub',
    command_executor='http://172.27.155.64:31548/wd/hub',
    desired_capabilities=getattr(DesiredCapabilities, browser)
  )
  driver.get("http://google.com")
  assert "google" in driver.page_source
  driver.quit()
  print("Browser %s checks out!" % browser)


@app.route("/")
def hello():
    return "Hello from Python!"


@app.route("/test-chrome")
def testChrome():
    check_browser("CHROME")

  
@app.route("/test-firefox")
def testFirefox():
    check_browser("FIREFOX")


if __name__ == "__main__":
    app.run(host='0.0.0.0')

