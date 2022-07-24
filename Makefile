.Phony: mysql maria redis postgres psql mongo mongosh
mysql:
	docker run -d --name mysql_dev -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 --restart always mysql
	echo "mysql://root:password@127.0.0.1:3306"

maria:
	docker run -d --name maria_dev -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 --restart always mariadb
	echo "mysql://root:password@127.0.0.1:3306"

postgres:
	docker run -d --name postgres_dev -e POSTGRES_PASSWORD=password -p 5432:5432 --restart always  postgres:alpine
	echo "postgresql://postgres:password@127.0.0.1:3306"
psql:
	docker exec -it postgres_dev psql -Upostgres


mongo:
	docker run -d --name mongo_dev --network host -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=password -v mongo_dev_volume:/data/db --restart always mongo
	docker run -d --name mongo_express_dev --network host -e ME_CONFIG_MONGODB_SERVER=localhost -e ME_CONFIG_MONGODB_ADMINUSERNAME=root -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --restart always mongo-express
	echo "mongodb://root:password@localhost:27017/logger?authSource=admin"
	echo "mongo-express at http://localhost:8081/"

mongo-network:
	docker network create -d bridge mongo-network
	docker run -d --name mongo_dev --network mongo-network -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=password -v mongo_dev_volume:/data/db -p 27017:27017 --restart always mongo
	docker run -d --name mongo_express_dev --network mongo-network -e ME_CONFIG_MONGODB_SERVER=mongo_dev -e ME_CONFIG_MONGODB_ADMINUSERNAME=root -e ME_CONFIG_MONGODB_ADMINPASSWORD=password -p 8081:8081 --restart always mongo-express
	echo "mongodb://root:password@localhost:27017/logger?authSource=admin"
	echo "mongo-express at http://localhost:8081/"

mongosh:
	docker exec -it mongo_dev mongosh -u root -p password

redis:
	docker run -d --name redis_dev -p 6379:6379 --restart always redis
	echo "redis://127.0.0.1:6379"
	echo "warning: didn't enable auth"

        
