# Normal run
ansible-playbook site.yaml --limit pihole

# Force DB cleanup on version change or recover from corruption
ansible-playbook site.yaml --limit pihole -e pihole_clean_db=true