NAME = p3

all:
	sh scripts/creation-deployement.sh

docker :
	sh scripts/install-docker.sh

env :
	sh scripts/installation-tools.sh

clean:
	k3d cluster delete $(NAME)

bclean:
	helm uninstall gitlab -n gitlab
	kubectl delete all --all -n gitlab

re : clean all

.PHONY: all clean re env

# kubectl rollout restart deployment argocd-server -n argocd
