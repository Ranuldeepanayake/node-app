sudo apt update -y && sudo apt upgrade -y

sudo apt install net-tools

sudo swapoff -a

sudo sed -i '/ swap / s/^/#/' /etc/fstab

sudo hostnamectl set-hostname "kubernetes-master-1"

exec bash

#Need to run as root
#sudo echo -e "\nkubernetes-master-1\t192.168.1.35
#kubernetes-master-2\t192.168.1.36
#kubernetes-worker-1\t192.168.1.37
#kubernetes-worker-2\t192.168.1.38
#kubernetes-worker-3\t192.168.1.39" >> /etc/hosts

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay

sudo modprobe br_netfilter

sudo sysctl --system

sudo apt update

sudo apt-get install -y apt-transport-https ca-certificates curl

sudo mkdir /etc/apt/keyrings

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update

sudo apt install -y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1

sudo apt install -y docker.io

sudo mkdir /etc/containerd

sudo sh -c "containerd config default > /etc/containerd/config.toml"

sudo sed -i 's/ SystemdCgroup = false/ SystemdCgroup = true/' /etc/containerd/config.toml

sudo systemctl restart containerd.service

sudo systemctl restart kubelet.service

sudo systemctl enable kubelet.service

###############################Steps for master configuration
#sudo kubeadm config images pull

#sudo kubeadm init --pod-network-cidr=10.1.0.0/16

#mkdir -p $HOME/.kube

#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

#sudo chown $(id -u):$(id -g) $HOME/.kube/config

#kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml