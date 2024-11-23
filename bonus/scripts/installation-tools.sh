#!/bin/bash 

# Créer le namespace gitlab
echo "\033[0;32mCréer le namespace gitlab\033[0;0m"
kubectl create namespace gitlab

# Installer Gitlab
echo "\033[0;32mInstaller Gitlab\033[0;0m"
helm install gitlab gitlab/gitlab \
    --namespace gitlab \
    --set global.hosts.domain=localhost \
    --set global.hosts.https=false \
    --set global.ingress.configureCertmanager=false \
    --set gitlab-runner.gitlabUrl=gitlab-webservice-default.gitlab.svc.cluster.local \
    --set gitlab-runner.install=false

echo "\033[0;32mAttendre que tous les pods dans le namespace gitlab atteignent l'état Ready\033[0;0m"
kubectl wait -n gitlab --for=condition=Ready pods --all --timeout=120s
kubectl get pods -n gitlab

echo "\033[0;32mObtenir le mot de passe initial\033[0;0m"
kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode > gitlab.pass

# Gestion du port-forwarding
echo "\033[0;32mDémarrage du port-forwarding\033[0;0m"
kubectl port-forward service/gitlab-webservice-default -n gitlab 8443:8181 --address='0.0.0.0' &
