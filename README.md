# GKE Cluster terraform

## Settting variables

```
export GOOGLE_APPLICATION_CREDENTIALS={SERVICE_ACCOUNT_JSON}
export GOOGLE_PROJECT={MY_PROJECT}
export GOOGLE_REGION={MY_REGION}
```

## Connecting to private GKE Cluster

### Connecting to Bastion host

```
gcloud compute ssh {BASTION_HOST_NAME} --zone {REGION_NAME}
```

### Authenticate to the GCP console
```
gcloud auth login {ACCOUNT}
```

### Authenticate to GKE Cluster 

```
gcloud container clusters get-credentials {CLUSTER_NAME} --region {REGION_NAME} --project {PROJECT_NAME}
```
## Creating Deployment and Services

Review these example instructions -> https://github.com/colopezfuentes/workloads-kubernetes


