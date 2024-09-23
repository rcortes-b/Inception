#Customize your own data

NETWORK_NAMES= srcs_inception
VOL_DATAMDB= ../data/mariadb/*
VOL_DATAWP= ../data/wordpress/*

all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re: fclean all

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);
	docker network rm $(NETWORK_NAMES);

fclean: clean	
	@rm -rf $(VOL_DATAMDB);
	@rm -rf $(VOL_DATAWP);

.PHONY: all re down clean fclean
