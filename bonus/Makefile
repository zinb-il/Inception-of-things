NAME = p3

all:
	sh ../p3/scripts/creation-deployement.sh

docker :
	sh ../p3/scripts/install-docker.sh

env :
	sh scripts/installation-helm.sh

clean:
	k3d cluster delete $(NAME)
	docker system prune -a -f

bclean:
	helm uninstall gitlab -n gitlab
	kubectl delete all --all -n gitlab
	kubectl delete namespaces gitlab

bonus:
	sh scripts/installation-tools.sh

re : clean all

.PHONY: all clean re env bonus
