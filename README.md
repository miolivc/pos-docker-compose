## Exemplo de Networks e Volumes utilizando Docker Compose

**1. Como iniciar os containers para usar a aplicação:** `sh run.sh`

**2. Como parar os containers:** `sh stop.sh`

**3. Como funciona a configuração do volume:** nas informações referentes ao serviço que você deseja 
criar um volume para ele, coloque a propriedade `volumes` e logo em seguida descreva o volume a ser criado
no padrão `pastaMaquinaLocal:pastaHostRemoto`.  

**4. Como funciona a configuração do network:** para definir uma rede você precisa definir a propriedade 
`networks` que conterá a propriedade `external` que referencia uma rede já criada e dentro do external deve ser configurado o parametro `name` com o nome da rede à ser utilizada.  
Para criar a rede execute o comando: `docker network create <nome-rede>`, no caso do exemplo `pos-aula `.

**Exemplo de uso:**

```
version: '2'
networks:
  pos-aula:
    external:
      name: pos-aula
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
