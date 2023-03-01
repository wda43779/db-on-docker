if grep -R "password" docker-compose.yml
then
	echo "use a safe password"
else
	docker-compose up -d
	echo "phpmyadmin: http://localhost:8001/"
	echo "in your code: mysql://root:password@localhost:3306"
fi