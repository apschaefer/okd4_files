$TTL    604800
@       IN      SOA     okd4-services.home.lab. admin.home.lab. (
                  1     ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800     ; Negative Cache TTL
)

; name servers - NS records
    IN      NS      okd4-services

; name servers - A records
okd4-services.home.lab.          IN      A       192.168.1.210

; OpenShift Container Platform Cluster - A records
okd4-bootstrap.okd.home.lab.        IN      A      192.168.1.200
okd4-control-plane-1.okd.home.lab.        IN      A      192.168.1.201
okd4-control-plane-2.okd.home.lab.         IN      A      192.168.1.202
okd4-control-plane-3.okd.home.lab.         IN      A      192.168.1.203
okd4-compute-1.okd.home.lab.        IN      A      192.168.1.204
okd4-compute-2.okd.home.lab.        IN      A      192.168.1.205

; OpenShift internal cluster IPs - A records
api.okd.home.lab.    IN    A    192.168.1.210
api-int.okd.home.lab.    IN    A    192.168.1.210
*.apps.okd.home.lab.    IN    A    192.168.1.210
etcd-0.okd.home.lab.    IN    A     192.168.1.201
etcd-1.okd.home.lab.    IN    A     192.168.1.202
etcd-2.okd.home.lab.    IN    A    192.168.1.203
console-openshift-console.apps.okd.home.lab.     IN     A     192.168.1.210
oauth-openshift.apps.okd.home.lab.     IN     A     192.168.1.210

; OpenShift internal cluster IPs - SRV records
_etcd-server-ssl._tcp.okd.home.lab.    86400     IN    SRV     0    10    2380    etcd-0.lab
_etcd-server-ssl._tcp.okd.home.lab.    86400     IN    SRV     0    10    2380    etcd-1.lab
_etcd-server-ssl._tcp.okd.home.lab.    86400     IN    SRV     0    10    2380    etcd-2.lab

