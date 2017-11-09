## Exemplo de Networks e Volumes utilizando Docker Compose

**1. Como iniciar os containers para usar a aplicação:** `sh run.sh`

**2. Como parar os containers:** `sh stop.sh`

**3. Como funciona a configuração do volume:** nas informações referentes ao serviço que você deseja 
criar um volume para ele, coloque a propriedade `volumes` e logo em seguida descreva o volume a ser criado
no padrão `pastaMaquinaLocal:pastaMaquinaRemota`.  

**4. Como funciona a configuração do network:** para definir uma rede você precisa definir a propriedade 
`networks` que conterá a sua network e as configurações para utilizá-la. O docker usa como padrão o `driver`
chamado bridge que tem como característica ser single-host. Para que o container use a network você deverá colocar
na definição do serviço a propriedade `networks`, onde seu valor será o nome da network que deseja utilizar.

**Exemplo de uso:**

```
version: '2'
networks:
  pos-aula:
    driver: bridge
services:
  postgres:
    build: ./postgres
    image: ricardojob/banco
    container_name: banco
    ports: 
      - "5433:5432"
    volumes:
      - ./postgres/data:/var/lib/postgresql/data
    networks: 
      - pos-aula
  web:
    build: .
    image: ricardojob/app
    container_name: app
    ports: 
      - "8082:8080" 
    links: 
      - "postgres:host-banco"
    networks: 
      - pos-aula 
```
