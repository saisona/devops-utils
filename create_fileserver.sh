#!/bin/bash

function create_fileserver {

cat << EOF > ~/Downloads/tmp_fileserver.yaml 	
apiVersion: v1
kind: PersistentVolume
metadata:
  name: fileserver-$1
spec:
  capacity:
    storage: 1000Gi
  accessModes:
  - ReadWriteMany
  nfs:
    path: /file_manager
    server: 10.32.29.122
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: fileserver-claim
spec:
  accessModes:
  - ReadWriteMany
  storageClassName: ""
  volumeName: fileserver-$1
  resources:
    requests:
      storage: 100Gi
EOF

cat ~/Downloads/tmp_fileserver.yaml | kubectl apply -n $1 -f -
echo "Created FileServer PV and PVC for $1 namespace"
kubectl get pvc -n $1
}

create_fileserver $1
