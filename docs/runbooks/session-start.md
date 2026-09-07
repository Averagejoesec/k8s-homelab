# 1. Verify Proxmox is up
ssh proxmox echo "ok"

# 2. Load SSH agent
eval $(ssh-agent) && ssh-add ~/.ssh/homelab

# 3. Start Gitea tunnel
ssh -L 9090:10.0.0.54:3000 proxmox -N -f

# 4. Verify Gitea is up
curl -s http://localhost:9090 | grep -o "Gitea"

# 5. Once cluster exists - verify nodes
kubectl get nodes