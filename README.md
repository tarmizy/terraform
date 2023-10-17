# Overview 

Note: Please run the command ("terraform init") in the project (folder) before you use the all file .tf

## Datadog

Please create file variable.tfvar using this for datadog.

```bash
    datadog_api_key = "xxx"
    datadog_app_key = "xxxx"
    datadog_api_url = "https://api.us5.datadoghq.com/"
```

After that running using path variable key using command. Example for plan and apply
```bash
    terraform plan -var-file='/Users/tarmizyharsha/Documents/learning/terrafom/datadog/variable.tfvars' 

    terraform apply -var-file='/Users/tarmizyharsha/Documents/learning/terrafom/datadog/variable.tfvars' 
```
and done, please check your datadog.

for distroy/apply spesific target using this command
```bash
    terraform apply -target=’resource.name’ #one target
    terraform destroy -target RESOURCE_TYPE.NAME -target RESOURCE_TYPE2.NAME #multiple target
    
    example one target: terraform destroy -target='datadog_role.ro_role' -var-file='/Users/tarmizyharsha/Documents/learning/terrafom/datadog/variable.tfvars'

```

## UptimeRobot Monitoring Link Apps
Please create file variable.tfvar using this for datadog.

```bash
    uptimerobot_api_key = "xxxx"
```

After that running using path variable key using command. Example for plan and apply
```bash
    terraform plan -var-file='/Users/tarmizyharsha/Documents/learning/terrafom/uptimerobot/variable.tfvars' 

    terraform apply -var-file='/Users/tarmizyharsha/Documents/learning/terrafom/uptimerobot/variable.tfvars' 
```

# Authors

- [@tarmizyharsha]