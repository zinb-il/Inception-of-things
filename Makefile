NAME = p3

all:
	sh p3/scripts/creation-deployement.sh

docker :
	sh p3/scripts/install-docker.sh

env :
	sh p3/scripts/installation-tools.sh

clean:
	k3d cluster delete $(NAME)

bonus:
	sh bonus/scripts/installation-tools.sh

re : clean all

.PHONY: all clean re env bonus
