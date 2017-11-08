mvn clean package
docker-compose up -d
echo "\nAplicação disponível em http://localhost:8082/app\n"
# docker build -t ricardojob/banco ./postgres
# docker run -p 5433:5432 -d --name banco -v $(pwd)/data:/var/lib/postgresql/data ricardojob/banco
# mvn clean package
# docker build -t ricardojob/pos-aula .
# docker run -p 8082:8080 -d --name app --link banco:host-banco ricardojob/pos-aula
# x-www-browser localhost:8082/app

