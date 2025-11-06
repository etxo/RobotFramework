*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

*** Tasks ***
Try To SetUp Webdriver
    Open Browser    https://robotframework.org     chrome   executable_path=${EXECDIR}/.venv/bin/chromedriver