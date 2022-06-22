# ----------------------------------------------------------------------
# -> Inception makefile
# Bare minimum : all, clean fclean and re
# ----------------------------------------------------------------------

# -> Variables 
HOSTS 		= /etc/hosts

IWORDPRESS	= wordpress
IMARIADB	= mariadb
INGINX		= nginx
IALPINE		= alpine:3.14

CWORDPRESS	= wordpress
CMARIADB	= mariadb
CNGINX		= nginx

VWORDPRESS = /home/mboy/data/wordpress/*
VMARIADB	= /home/mboy/data/mariadb/*

RESET   	= $'\033[0m
COLOR     	= $'\033[1;36m

# -> Pull images, build and run containers
all:
	@echo "$(COLOR)Updating hosts file...$(RESET)"
	sudo chmod 666 $(HOSTS)
	sudo echo "127.0.0.1 mboy.42.fr" >> $(HOSTS)
	sudo echo "127.0.0.1 www.mboy.42.fr" >> $(HOSTS)
	sudo chmod 644 $(HOSTS)
	@echo "$(COLOR)Hosts file is up to date !$(RESET)"
	
	@echo "$(COLOR)\nBuilding containers...$(RESET)"
	cd srcs && sudo docker-compose up --build
	@echo "$(COLOR)Containers ready for usage !$(RESET)"

# -> Output containers, images and volumes state
inspect:
	@echo "$(COLOR)\nCurrent containers state :$(RESET)"
	sudo docker ps -a
	@echo "$(COLOR)\nCurrent images state :$(RESET)"
	sudo docker images
	@echo "$(COLOR)\nCurrent volumes state :$(RESET)"
	sudo docker volume ls


# -> Stop images and containers
clean:
	@echo "$(COLOR)\nDestroying containers and images...$(RESET)"
	sudo docker rm $(CWORDPRESS) $(CMARIADB) $(CNGINX)
	sudo docker rmi $(IWORDPRESS) $(IMARIADB) $(INGINX) $(IALPINE)
	@echo "$(COLOR)All containers and images have been successfully removed !$(RESET)"
	
	@echo "$(COLOR)\nHope to see you soon !$(RESET)"

# -> Remove all
fclean :
	@echo "$(COLOR)\nDestroying containers and images...$(RESET)"
	sudo docker rm $(CWORDPRESS) $(CMARIADB) $(CNGINX)
	sudo docker rmi $(IWORDPRESS) $(IMARIADB) $(INGINX) $(IALPINE)
	@echo "$(COLOR)All containers and images have been successfully removed !$(RESET)"

	@echo "$(COLOR)\nRemoving volumes...$(RESET)"
	sudo docker volume prune
	sudo rm -rf $(VWORDPRESS) $(VMARIADB)
	@echo "$(COLOR)All volumes hav been removed.$(RESET)"
	
	@echo "$(COLOR)\nPretty impresive ? !$(RESET)"

# -> Clean project and re-run containers
re : clean all