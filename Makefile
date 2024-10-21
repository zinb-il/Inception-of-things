NAME = p3

all:
	sh p3/scripts/installation-tools.sh
	sh p3/scripts/creation-deployement.sh

clean:
	k3d cluster delete $(NAME)

.PHONY: all clean
