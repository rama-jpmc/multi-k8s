docker build -t rmahajanam/multi-client:latest rmahajanam/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t rmahajanam/multi-server:latest rmahajanam/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t rmahajanam/multi-worker:latest rmahajanam/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push rmahajanam/multi-client:latest
docker push rmahajanam/multi-client:$SHA
docker push rmahajanam/multi-server:latest
docker push rmahajanam/multi-server:$SHA
docker push rmahajanam/multi-worker:latest
docker push rmahajanam/multi-worker:$SHA
###
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ramahajanam/multi-server:$SHA
kubectl set image deployments/client-deployment client=ramahajanam/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=ramahajanam/multi-worker:$SHA
~                                                                                         