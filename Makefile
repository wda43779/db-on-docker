.Phony: mysql maria mongo redis
mysql:
	docker run -d --name mysql_dev -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 --restart always mysql
	echo "mysql://root:password@127.0.0.1:3306"

maria:
	docker run -d --name maria_dev -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 --restart always mariadb
	echo "mysql://root:password@127.0.0.1:3306"

mongo:
	docker run -d --name mongo_dev -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=password -p 27017:27017 --restart always mongo
	echo "mongodb://root:password@127.0.0.1:27017"

redis:
	docker run -d --name redis_dev -p 6379:6379 --restart always redis
	echo "redis://127.0.0.1:6379"
	echo "waring: didn't enable auth"

        
