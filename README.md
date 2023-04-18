# Joinville Doa

Esse repositório se dedica ao projeto de conclusão do Curso de Análise e Desenvolvimento de Sistemas,
na faculdade Senac em Joinville-SC.

O Projeto é desenvolvido em ruby utilizando o framework Ruby on Rails, construindo API's utilizando GraphQL como arquitetura (ou linguagem de consulta) para nossas API's.

Como buildar o projeto:

## Dependências

* Versão do Docker:
    - 23.0.1

* Versão do Docker-compose:
    - v2.3.3

* Versão do Ruby:
    - 3.2.1

* Versão do Rails:
    - 7.0.4.3

* Versão do Postgres:
    - 15.2

## Configuração

* Após instalar o docker e o docker-compose basta executar o comando `make setup` que ele irá fazer todo o setup da aplicação, e posteriormente executar o comando `make up` para subir a aplicação.


* comandos
    - `make setup` Faz a configuração da aplicação
    - `make up` Sobe a aplicação
    - `make down` Força que a aplicação seja encerrada
    - `make restart` Reinicia a aplicação
    - `make bash-web` Entra no bash do container da aplicação
    - `make bash-db` Entra no bash do dontainer de banco de dados
