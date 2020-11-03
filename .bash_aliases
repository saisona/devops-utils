
alias cl=clear
alias ne=vim
alias ops="cd ~/Workspace/Inarix/OPS"
alias dev="cd ~/Workspace/Inarix/DEV"

## Git Aliases
alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gl="git log"
alias cleanup="git fetch --prune && git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"

## Terraform Aliases
alias tf="terraform"
alias ta="terraform apply"
alias td="terraform delete"

## Kubectl Aliases
alias k=kubectl
alias kp="kubectl get pods"
alias kl="kubectl logs"
alias ke="kubectl edit"
alias kg="kubectl get"
alias kd="kubectl describe"
alias ks="kubectl get svc"
alias ki="kubectl get ingress"
alias kin="kubectl get inferenceservice -n kubeflow"
alias kstatus="kg cm -n kube-system cluster-autoscaler-status -oyaml"

alias kerr="kubectl get pods -n kubeflow | grep Error | cut -d' ' -f 1 | xargs kubectl delete pod -n kubeflow"
