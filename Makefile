all:
	@docker-compose -f ./docker-compose.yml up -d --build

down:
	@docker-compose -f ./docker-compose.yml down

re: clean all

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm inception_inception;
	@rm -rf ../data/mariadb/*;
	@rm -rf ../data/wordpress/*;

.PHONY: all re down clean
