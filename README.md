# Overview 


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

