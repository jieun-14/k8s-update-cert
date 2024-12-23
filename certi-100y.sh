# 인증서 유효기간 확인
openssl x509 -in $(kubectl config view --raw -o jsonpath='{.users[0].user.client-certificate}') -noout -text | grep 'Not'
kubeadm certs check-expiration

CERTIFICATE                EXPIRES                  RESIDUAL TIME   CERTIFICATE AUTHORITY   EXTERNALLY MANAGED
admin.conf                 Dec 19, 2025 14:15 UTC   364d            ca                      no
apiserver                  Dec 19, 2025 14:15 UTC   364d            ca                      no
apiserver-etcd-client      Dec 19, 2025 14:15 UTC   364d            etcd-ca                 no
apiserver-kubelet-client   Dec 19, 2025 14:15 UTC   364d            ca                      no
controller-manager.conf    Dec 19, 2025 14:15 UTC   364d            ca                      no
etcd-healthcheck-client    Dec 19, 2025 14:15 UTC   364d            etcd-ca                 no
etcd-peer                  Dec 19, 2025 14:15 UTC   364d            etcd-ca                 no
etcd-server                Dec 19, 2025 14:15 UTC   364d            etcd-ca                 no
front-proxy-client         Dec 19, 2025 14:15 UTC   364d            front-proxy-ca          no
scheduler.conf             Dec 19, 2025 14:15 UTC   364d            ca                      no
super-admin.conf           Dec 19, 2025 14:15 UTC   364d            ca                      no

CERTIFICATE AUTHORITY   EXPIRES                  RESIDUAL TIME   EXTERNALLY MANAGED
ca                      Dec 17, 2034 14:15 UTC   9y              no
etcd-ca                 Dec 17, 2034 14:15 UTC   9y              no
front-proxy-ca          Dec 17, 2034 14:15 UTC   9y              no


# git
git clone https://github.com/yuyicai/update-kube-cert.git

# 10년을 100년으로 변경
cd update-kube-cert
vi update-kubeadm-cert.sh
    CERT_DAYS=36500 # 3650에서 36500으로 변경경

# 실행
chmod 755 update-kubeadm-cert.sh
./update-kubeadm-cert.sh all --cri containerd


# 실행 후 확인
kubeadm certs check-expiration

CERTIFICATE                EXPIRES                  RESIDUAL TIME   CERTIFICATE AUTHORITY   EXTERNALLY MANAGED
admin.conf                 Nov 26, 2124 13:21 UTC   99y             ca                      no
apiserver                  Nov 26, 2124 13:21 UTC   99y             ca                      no
apiserver-etcd-client      Nov 26, 2124 13:21 UTC   99y             etcd-ca                 no
apiserver-kubelet-client   Nov 26, 2124 13:21 UTC   99y             ca                      no
controller-manager.conf    Nov 26, 2124 13:21 UTC   99y             ca                      no
etcd-healthcheck-client    Nov 26, 2124 13:21 UTC   99y             etcd-ca                 no
etcd-peer                  Nov 26, 2124 13:21 UTC   99y             etcd-ca                 no
etcd-server                Nov 26, 2124 13:21 UTC   99y             etcd-ca                 no
front-proxy-client         Nov 26, 2124 13:21 UTC   99y             front-proxy-ca          no
scheduler.conf             Nov 26, 2124 13:21 UTC   99y             ca                      no
super-admin.conf           Nov 26, 2124 13:21 UTC   99y             ca                      no

CERTIFICATE AUTHORITY   EXPIRES                  RESIDUAL TIME   EXTERNALLY MANAGED
ca                      Dec 17, 2034 14:15 UTC   9y              no
etcd-ca                 Dec 17, 2034 14:15 UTC   9y              no
front-proxy-ca          Dec 17, 2034 14:15 UTC   9y              no
