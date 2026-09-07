# Security Hardening Runbook

## Pod Security Standards
- gadgetbridge: restricted (blocks privileged, requires non-root, read-only root fs)
- monitoring: baseline (blocks privileged, allows some flexibility)
- cicd: baseline

### Test PSA is working
kubectl apply a privileged pod to gadgetbridge - should be Forbidden

## RBAC Design
- Each namespace has a dedicated ServiceAccount
- Least privilege - only verbs needed for operation
- CICD SA has deploy rights to gadgetbridge only
- Monitoring SA has cluster-wide read for metrics

### Verify RBAC
kubectl auth can-i <verb> <resource> --as system:serviceaccount:<ns>:<sa>

## NetworkPolicy
- Default deny all ingress and egress per namespace
- Explicit allow-dns so CoreDNS resolution works
- Additional allows added per application need

### Common debug
kubectl describe networkpolicy -n <namespace>
