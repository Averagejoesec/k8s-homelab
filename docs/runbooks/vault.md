# Vault Runbook

## Auth Architecture

Gitea Actions
└── holds VAULT_SECRET_ID_TOKEN (secretid-generator policy only)
└── holds VAULT_TERRAFORM_ROLE_ID (not sensitive)
│
▼
Generates Secret ID at pipeline runtime (10min TTL, 1 use)
│
▼
Exchanges Role ID + Secret ID for Vault Token (1hr TTL)
│
▼
Terraform reads secrets from Vault
Token expires when job finishes


## Unsealing Vault
Vault seals itself on restart. After Proxmox or VM reboot:
```bash
ssh vault-vm
export VAULT_ADDR='http://10.0.0.57:8200'
vault operator unseal <key-1>
vault operator unseal <key-2>
vault status
```

## Token Renewal
```bash
source ~/.config/homelab/vault-tokens.env
vault token renew
```

## Adding a New Secret
```bash
vault login <root-token>
vault kv put homelab/<path> key="value"
```

## Checking Token Permissions
```bash
vault token capabilities homelab/data/proxmox
```