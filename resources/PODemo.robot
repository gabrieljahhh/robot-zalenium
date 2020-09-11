*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variable ***
${HOME_URL}             https://www.saucedemo.com/
${HOME_TITLE}           Swag Labs
${LOGIN_IMG}            xpath=//html/body/div[2]/div[1]/img
${INPUT_USERNAME}       id=user-name
${INPUT_PASSWORD}       id=password
${BTN-LOGIN}            id=login-button
${PRODUCT_IMG}          id=item_5_img_link
${PRODUCT_NAME}         xpath=//*[@id="item_5_title_link"]
${PRODUCT_DETAILS}      xpath=//*[@id="inventory_item_container"]/div/div/img[@class="inventory_details_img"]
${BTN-ADD}              xpath=//*[@id="inventory_item_container"]/div/div/div/button["ADD TO CART"]
${SPAN-COUNT}           xpath=//*[@id="shopping_cart_container"]/a/span
${BTN-CHECKOUT}         xpath=//*[@id="cart_contents_container"]/div/div[2]/a[@class="btn_action checkout_button"]
${INPUT_NAME}           id=first-name
${INPUT_LASTNAME}       id=last-name
${INPUT_ZIPCODE}        id=postal-code
${BTN_CONTINUE}         xpath=//*[@id="checkout_info_container"]/div/form/div/input[@value="CONTINUE"]
${SUMMARY}              css=.summary_value_label
${BTN_FINISH}           xpath=//*[@id="checkout_summary_container"]/div/div/div/a[@class="btn_action cart_button"]
${MSG}                  xpath=//*[@id="checkout_complete_container"]/h2
*** Keywords ***
Acessar a pàgina de login do site
  Go To                             ${HOME_URL}
  Wait Until Element Is Visible     ${LOGIN_IMG}
  Title Should Be                   ${HOME_TITLE}

Digitar usuario "${USERNAME}" e senha "${PASSWORD}"
  Input Text                        ${INPUT_USERNAME}    ${USERNAME}
  Input Text                        ${INPUT_PASSWORD}    ${PASSWORD}

Clicar no botão login
  Click Element                     ${BTN-LOGIN}

Clicar no produto
  Wait Until Element Is Visible     ${PRODUCT_IMG}
  Click Element                     ${PRODUCT_NAME}

Adiconar produto no Carrinho
  Wait Until Element Is Visible     ${PRODUCT_DETAILS}
  Click Element                     ${BTN-ADD}

Verificar Carrinho
  Click Element                     ${SPAN-COUNT}

Ir para checkout
  Click Element                     ${BTN-CHECKOUT}

Preencher "${NAME}" "${LASTNAME}" "${ZIPCODE}"
  Input Text                        ${INPUT_NAME}    ${NAME}
  Input Text                        ${INPUT_LASTNAME}    ${LASTNAME}
  Input Text                        ${INPUT_ZIPCODE}    ${ZIPCODE}
  Click Element                     ${BTN_CONTINUE}

Finalizar Compra
  Get Text                          ${SUMMARY}
  Log To Console                    ${SUMMARY}
  Click Element                     ${BTN_FINISH}
  Element Text Should Be            ${MSG}    THANK YOU FOR YOUR ORDER
