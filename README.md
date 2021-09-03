# Debug Container
_This is built to address the use case of deploying an app into a kubernetes cluster and testing the network configurations._

## Tools Included
- wget 
- curl 
- netstat
- nmap
- grpcurl
- hping3
- nc (netcat)

## Build Local
```
docker build -t docker.io/cmwylie19/debug-container:latest .; docker push docker.io/cmwylie19/debug-container:latest;k rollout restart deploy/debug
```

## Install in kubernetes
```
kubectl apply -f k8s/
```

## Exec into the service
```
kubectl exec -it svc/debug -- sh
```

## Run Commands
```
# curl a service in your cluster, in this case httpbin
curl -i httpbin.default.svc.cluster.local:8000/get

# if you have a grpc service called grpc-tests exposed at port 8080
grpcurl -plaintext grpc-tests:8080 list

# Run TCPDump
tcpdump eth0

# DIG
dig httpbin.default.svc.cluster.local

# netstat numeric route
netstat -rn
```

