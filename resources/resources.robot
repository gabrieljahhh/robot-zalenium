*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variable ***
${BROWSER}    chrome


*** Keywords ***

Abrir navegador
    Open Browser    about:blank    ${BROWSER}   remote_url=http://192.168.1.152:4444/wd/hub
    Maximize Browser Window

Fechar navegador
    Close Browser
