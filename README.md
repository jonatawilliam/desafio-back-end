





# BLU - Desafio Back End 

Jonata William


## Sumário

* [Introdução](#Introdução)
  - [Desafio](#Desafio)
  - [Instruções](#Instruções)
  - [Descrição](#Descrição)
* [CNAB](#CNAB)
* [Transações](#Transações)
* [Avaliação](#Avaliação)
* [Referência](#Referência)
* [Testar](#Testar)
  - [QuickStart](#QuickStart)
  - [Docker](#Docker)
  - [Local](#Local)

## Introdução

### Desafio

Por favor leiam este documento do começo ao fim, com muita atenção.
O intuito deste teste é avaliar seus conhecimentos técnicos com o back-end, para ser mais específico em Ruby.

O teste consiste em parsear [este arquivo de texto(CNAB)](https://github.com/Pagnet/desafio-back-end/blob/master/CNAB.txt) e salvar suas informações(transações financeiras) em uma base de dados a critério do candidato.

Este desafio deve ser feito por você em sua casa. Gaste o tempo que você quiser, porém normalmente você não deve precisar de mais do que algumas horas.

### Instruções

1. Primeiro, faça um fork deste projeto para sua conta no Github (crie uma se você não possuir).
2. Em seguida, implemente o projeto tal qual descrito abaixo, em seu clone local.
3. Por fim, envie via email um arquivo patch para seu contato na BLU.

### Descrição

Você recebeu um arquivo CNAB com os dados das movimentações finanaceira de várias lojas.
Precisamos criar uma maneira para que estes dados sejam importados para um banco de dados.

Sua tarefa é criar uma interface web que aceite upload do [arquivo CNAB](https://github.com/Pagnet/desafio-back-end/blob/master/CNAB.txt), normalize os dados e armazene-os em um banco de dados relacional e exiba essas informações em tela.

**Sua aplicação web DEVE:**

1. Ter uma tela (via um formulário) para fazer o upload do arquivo
2. Interpretar ("parsear") o arquivo recebido, normalizar os dados, e salvar corretamente a informação em um banco de dados relacional, **se atente as documentações** que estão logo abaixo.
3. Exibir uma lista das operações importadas por lojas, e nesta lista deve conter um totalizador do saldo em conta
4. Ser escrita obrigatoriamente em Ruby 2.0+
5. Ser simples de configurar e rodar, funcionando em ambiente compatível com Unix (Linux ou Mac OS X). Ela deve utilizar apenas linguagens e bibliotecas livres ou gratuitas.

**Sua aplicação web não precisa:**

1. Lidar com autenticação ou autorização (pontos extras se ela fizer, mais pontos extras se a autenticação for feita via OAuth).
2. Ser escrita usando algum framework específico (mas não há nada errado em usá-los também, use o que achar melhor).

## CNAB
### Documentação do CNAB

| Descrição do campo  | Inicio | Fim | Tamanho | Comentário
| ------------- | ------------- | -----| ---- | ------
| Tipo  | 1  | 1 | 1 | Tipo da transação
| Data  | 2  | 9 | 8 | Data da ocorrência
| Valor | 10 | 19 | 10 | Valor da movimentação. *Obs.* O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
| CPF | 20 | 30 | 11 | CPF do beneficiário
| Cartão | 31 | 42 | 12 | Cartão utilizado na transação 
| Hora  | 43 | 48 | 6 | Hora da ocorrência atendendo ao fuso de UTC-3
| Dono da loja | 49 | 62 | 14 | Nome do representante da loja
| Nome loja | 63 | 81 | 19 | Nome da loja

## Transações
### Documentação sobre os tipos das transações

| Tipo | Descrição | Natureza | Sinal |
| ---- | -------- | --------- | ----- |
| 1 | Débito | Entrada | + |
| 2 | Boleto | Saída | - |
| 3 | Financiamento | Saída | - |
| 4 | Crédito | Entrada | + |
| 5 | Recebimento Empréstimo | Entrada | + |
| 6 | Vendas | Entrada | + |
| 7 | Recebimento TED | Entrada | + |
| 8 | Recebimento DOC | Entrada | + |
| 9 | Aluguel | Saída | - |

## Avaliação

Seu projeto será avaliado de acordo com os seguintes critérios.

1. Sua aplicação preenche os requerimentos básicos?
2. Você documentou a maneira de configurar o ambiente e rodar sua aplicação?
3. Você seguiu as instruções de envio do desafio?
4. Qualidade e cobertura dos testes unitários.

Adicionalmente, tentaremos verificar a sua familiarização com as bibliotecas padrões (standard libs), bem como sua experiência com programação orientada a objetos a partir da estrutura de seu projeto.

## Referência

Este desafio foi baseado neste outro desafio: https://github.com/lschallenges/data-engineering

---

Boa sorte!

### Testar


#### QuickStart

Faça o download e execute o arquivo [desafio-back-end-Jonata.sh](https://jw-github.s3.amazonaws.com/desafio-back-end-Jonata.sh) e siga as instruções
```bash
sh desafio-back-end-Jonata.sh
```

Ou execute este comando:
```bash
sh -c "$(curl -fsSL https://jw-github.s3.amazonaws.com/desafio-back-end-Jonata.sh)"
```


#### Docker

Se você não tiver o Docker no computador, siga as instruções de instalação no Docker, Github([mais informações aqui](https://github.com/docker/docker-install)).

Clone o projeto no diretório de sua escolha.
```bash
git clone https://github.com/jonatawilliam/desafio-back-end
cd your-project-name
```

Execute o comando do Docker para compilação e executar a aplicação.
```bash
docker-compose up --build -V
```

Acesse a aplicação em:

http://localhost:3000(http://localhost:3000)



#### Local

- Instale a versão 2.6.3 do ruby e configure-a com o seu gerenciador de ambiente ruby ([mais informações aqui](https://www.ruby-lang.org/en/documentation/installation/)).
- Instale o PostgresSQL e inicie o servidor PostgresSQL em primeiro plano ([mais informações aqui](https://wiki.postgresql.org/wiki/Detailed_installation_guides)).
- Clone o repositório e acesse o diretório clonado:

```bash
git clone https://github.com/jonatawilliam/desafio-back-end
cd nome-do-seu-projeto
```

- Alterar o arquivo 'database.yml' conforme abaixo:

Atual
```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: database
  username: postgres
development:
  <<: *default
  database: desafio-back-end_development
test:
  <<: *default
  database: desafio-back-end_test
production:
  <<: *default
  database: desafio-back-end_production
  username: desafio-back-end
  password: <%= ENV['DESAFIO-BACK-END_DATABASE_PASSWORD'] %>

```

Modificado
```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: postgres
development:
  <<: *default
  database: desafio-back-end_development
test:
  <<: *default
  database: desafio-back-end_test
production:
  <<: *default
  database: desafio-back-end_production
  username: desafio-back-end
  password: <%= ENV['DESAFIO-BACK-END_DATABASE_PASSWORD'] %>

```

- Executar os comando no diretório do projeto:

Baixar e atualizar as gems: 
```bash
bundle install
```

Criar banco de dados, suas migartes e inserir os tipos de transações: 
```bash
rake db:create cd:migrate db:seed
```

Inicializar servidor Puma: 
```bash
rails s
```
