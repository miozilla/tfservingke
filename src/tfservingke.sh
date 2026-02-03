#!/bin/sh
# Task 1. Getting lab files

cd
SRC_REPO=https://github.com/GoogleCloudPlatform/mlops-on-gcp
kpt pkg get $SRC_REPO/workshops/mlep-qwiklabs/tfserving-gke-autoscaling tfserving-gke
cd tfserving-gke


# Task 2. Creating a GKE cluster

gcloud config set compute/zone us-west1-c

PROJECT_ID=$(gcloud config get-value project)
CLUSTER_NAME=cluster-1

gcloud beta container clusters create $CLUSTER_NAME \
  --cluster-version=latest \
  --machine-type=e2-standard-4 \
  --enable-autoscaling \
  --min-nodes=1 \
  --max-nodes=3 \
  --num-nodes=1 

gcloud container clusters get-credentials $CLUSTER_NAME 


# Task 3. Deploying ResNet101

export MODEL_BUCKET=${PROJECT_ID}-bucket
gsutil mb gs://${MODEL_BUCKET}

gsutil cp -r gs://spls/gsp777/resnet_101 gs://${MODEL_BUCKET}


# Task 4. Creating ConfigMap

echo $MODEL_BUCKET
sed -i "s/your-bucket-name/$MODEL_BUCKET/g" tf-serving/configmap.yaml

kubectl apply -f tf-serving/configmap.yaml


# Task 5. Creating TensorFlow Serving deployment

cat tf-serving/deployment.yaml

kubectl apply -f tf-serving/deployment.yaml

kubectl get deployments


# Task 6. Exposing the deployment

cat tf-serving/service.yaml

kubectl apply -f tf-serving/service.yaml

kubectl get svc image-classifier


# Task 7. Configuring horizontal pod autoscaler

kubectl autoscale deployment image-classifier \
--cpu-percent=60 \
--min=1 \
--max=4 

kubectl get hpa


# Task 8. Testing the model

EXTERNAL_IP=[YOUR_SERVICE_IP]
curl -d @locust/request-body.json -X POST http://${EXTERNAL_IP}:8501/v1/models/image_classifier:predict


# Task 9. Installing Locust

pip3 install locust==1.4.1

export PATH=~/.local/bin:$PATH

locust -V


# Task 10. Starting a load test

cd locust
locust -f tasks.py \
--headless \
--host http://${EXTERNAL_IP}:8501


# Task 11. Monitoring the load test

# https://console.cloud.google.com/kubernetes/deployment/us-west1-c/cluster-1/default/image-classifier/overview

# https://console.cloud.google.com/kubernetes/nodepool/us-west1-c/cluster-1/default-pool

# Task 12. Stopping the load test
# CTRL + C


