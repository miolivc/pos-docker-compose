mvn clean package
docker network create pos-aula
docker-compose up -d
echo "\nAplicação disponível em http://localhost:8082/app\n"
