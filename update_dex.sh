#!/bin/bash

function update_dex {
	cd ~/Downloads/KUBEFLOW
	kubectl create configmap dex --from-file=config.yaml=dex-config.yaml -n auth --dry-run -oyaml | kubectl apply -f -
	kubectl rollout restart deployment -n auth dex
	cd -
}

update_dex
