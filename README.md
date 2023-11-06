# Wrench Docker Image
The wrench docker image is a simple docker image only contains some necessary tools to debug network issues on a container environment specially in orchestration platforms like Kubernetes. 

# How to use it
To run with `docker` CLI just run following command:

```
docker run --rm --name wrench -d kinghossein/wrench:0.1
```

Here is a simply manifest to use `wrench` on Kubernetes cluster:

```
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: wrench-debugging
  labels:
    app: wrench
spec:
  replicas: 1
  serviceName: wrench
  selector:
    matchLabels:
      app: wrench-debug
  template:
    metadata:
      labels:
        app: wrench-debug
    spec:
      nodeSelector:
        kubernetes.io/hostname: <worker hostname>
      containers:
      - name: wrench-debug
        image: kinghossein/wrench:0.1
        resources:
          requests:
            cpu: 1
            memory: 1024Mi
        securityContext:
          allowPrivilegeEscalation: false
          privileged: false
```