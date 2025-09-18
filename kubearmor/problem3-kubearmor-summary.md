{Problem Statement 3 - KubeArmor Policy }

For Problem Statement 3, I attempted to create a **zero-trust KubeArmor policy** for the wisecow application deployed in PS1.

## KubeArmor Setup

- Installed KubeArmor using the official script:

curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
  
Verified pods in the cluster:

kubectl get pods -n kube-system | grep kubearmor

All KubeArmor components (kubearmor, controller, relay) were running successfully.

Policy Created:

Policy Name: block-shell-exec.yaml

Objective: Block shell access inside wisecow pod to prevent interactive shell execution.

Notes:

On WSL2, policy violations cannot be triggered or displayed because WSL2 does not support the Linux Security Module (LSM) features required by KubeArmor.

Attempted to test using:

kubectl exec -it wisecow-deployment-<pod> -- /bin/sh

karmor logs

but violations could not be recorded.

KubeArmor is active and policies are applied successfully.

Screenshots

Included screenshot of KubeArmor pods running in the cluster

Included screenshot of policy creation confirmation

Summary

Policy was successfully created and applied.

Attempted to generate a violation, but WSL2 limitations prevented this.
