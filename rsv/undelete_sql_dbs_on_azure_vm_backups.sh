#!/opt/homebrew/bin/zsh

# undelete backups for multiple items with IDs passed from file
cmd=("az" "backup" "protection" "undelete" "--container-name" "dbserverppd.servo.local" "--resource-group" "rg-servo-preprod" "--vault-name" "rsv-servo-sql-preprod" "--backup-management-type" "AzureWorkload" "--ids")

# Read IDs from a file and pass each one to the command
while IFS= read -r id
do
  "${cmd[@]}" "$id"
done < "ids.txt"