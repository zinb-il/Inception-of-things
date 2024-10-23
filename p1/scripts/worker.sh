while [ ! -e "/vagrant_data/node-token.txt" ]
do
  sleep 1
done

k3s_token=$(cat /vagrant_data/node-token.txt)
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$k3s_token  sh -
