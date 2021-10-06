# LEIA-ME

### Descrição e finalidade

Este projeto foi desenvolvido com a finalidade de melhorar meus conhecimentos em Rails quando operando junto com o PostgreSQL e também realizar testes simples desenvolvidos com o RSpec.

### Requisitos

Este guia assume que o usuário tenha o **docker-compose** e suas dependências em funcionamento. 

Esses são os únicos requisito para a execução, uma vez que a conteinerização do docker cuida de todas as outras dependências como o Ruby *(e suas gems)* e o banco de dados.

### Rodando a aplicação

Para rodar a aplicação é necessário clonar o repositório.

É indispensável renomear o arquivo `.env-template` para `.env` para que a aplicação tenha acesso às variáveis de ambiente necessárias.

Neste projeto iremos rodar dois serviços, onde um será responsável pela aplicação Rails e outro será responsável pelo Postgres.

Uma vez que o repositório estiver clonado, devemos navegar até a raíz deste e então realizar a build das imagens dos nossos contêineres:

```shell
$ sudo docker-compose build
```

_**Atenção -** O uso do **sudo** pode não ser necessária dependendo da sua instalação do docker-compose._

Após o término da execução, agora é necessário disponibilizar os serviços. Neste caso faremos isso com o comando `up` utilizando a flag `-d`. Essa flag fará com que os processos necessários rodem em segundo plano para que possamos continuar a utilizar nosso terminal:

```shell
$ sudo docker-compose up -d
```

Para conferir que os processos estão funcionando corretamente, podemos utilizar o comando `ps`:

```shell
$ sudo docker-compose ps
```

Caso esteja tudo certo, devemos ter um retorno como o seguinte:

           Name                     Command               State                    Ports                  
    ------------------------------------------------------------------------------------------------------
    testapp_database_1   docker-entrypoint.sh postgres    Up      5432/tcp                                
    testapp_web_1        entrypoint.sh bundle exec  ...   Up      0.0.0.0:3000->3000/tcp,:::3000->3000/tcp

Agora podemos popular o banco de dados utilizando o comando `exec` do docker-compose para fazer com que o nosso serviço `web` rode o comando `rails db:reset`. Esse comando é basicamente uma chamada implícita para uma série de comandos que deve (re)setar e popular nosso banco de acordo com as instruções do `seeds.rb`

```shell
$ sudo docker-compose exec web rails db:reset
```

Agora já é possível [acessar a aplicação](http://localhost:3000/) e fazer alguns testes.

### Rodando testes do RSpec

Assumindo que todos os passos acima foram executados, agora temos somente mais um passo antes de executar os testes escritos em RSpec:

Popular o banco de testes, uma vez que apenas o banco de desenvolvimento foi populado acima. Para tal, vamos usar um comando muito parecido com o anterior, mas que leva consigo a flag `-e`, responsável por setar variáveis de ambiente. Esse comando roda o mesmo `db:reset` mas com a diferença de fazê-lo no ambiente de testes do rails:

```shell
$ sudo docker-compose exec -e RAILS_ENV=test web rails db:reset
```

Com esse comando executado, agora podemos rodar os testes em si:

```shell
$ sudo docker-compose run -e RAILS_ENV=test web rspec
```

Esse comando executa os três testes que foram implementados:
* Ao mandar um **GET** para a rota '/cities/query' esperamos que requisição seja encaminhada para **CitiesController#Query**.
* Ao mandar um **GET** para o **CitiesController#Query** com certos parâmetros esperamos que o status HTTP da resposta seja 200 (OK).
* Ao mandar um **GET** para o **CitiesController#Query** os mesmos parâmetros esperamos que o corpo da resposta contenha "Pato Branco".

Passando nesses testes devemos obter no console:

    Finished in 0.05536 seconds (files took 0.64581 seconds to load)
    3 examples, 0 failures

