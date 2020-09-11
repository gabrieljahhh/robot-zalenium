


*** Settings ***
Resource         ../resources/PODemo.robot
Resource         ../resources/resources.robot

Test Setup       Abrir navegador
Test Teardown    Fechar navegador


*** Test Case ***
Demo Adicionar produto no Carrinho
  Acessar a pàgina de login do site
  Digitar usuario "standard_user" e senha "secret_sauce"
  Clicar no botão login
  Clicar no produto
  Adiconar produto no Carrinho
  Verificar Carrinho
  Ir para checkout
  Preencher "Gabriel" "Leite" "123456789"
  Finalizar Compra
