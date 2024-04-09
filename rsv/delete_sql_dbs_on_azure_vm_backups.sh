#!/opt/homebrew/bin/zsh

# disable backup protection for multiple items with IDs passed from file
cmd=("az" "backup" "protection" "disable" "--container-name" "dbserverppd.servo.local" "--backup-management-type" "AzureWorkload" "--delete-backup-data" "true" "--resource-group" "rg-servo-preprod" "--vault-name" "rsv-servo-sql-preprod" "--yes" "--ids")

# Read IDs from a file and pass each one to the command
while IFS= read -r id
do
  "${cmd[@]}" "$id"
done < "ids.txt"