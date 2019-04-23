#!/bin/bash

if [ "${PWD##*/}" == "create" ]; then
    KUBECONFIG_FOLDER=${PWD}/../../kube-configs
elif [ "${PWD##*/}" == "scripts" ]; then
    KUBECONFIG_FOLDER=${PWD}/../kube-configs
else
    echo "Please run the script from 'scripts' or 'scripts/create' folder"
fi

# Default to "Org1MSP" if not defined
if [ -z ${PEER_MSPID} ]; then
	echo "PEER_MSPID not defined. I will use \"Org1MSP\"."
	echo "I will wait 5 seconds before continuing."
	sleep 5
fi
PEER_MSPID=${PEER_MSPID:-Org1MSP}

# Default to "mychannel" if not defined
if [ -z "${CHANNEL_NAME}" ]; then
	echo "CHANNEL_NAME not defined. I will use \"mychannel\"."
	echo "I will wait 5 seconds before continuing."
	sleep 5
fi
CHANNEL_NAME=${CHANNEL_NAME:-mychannel}

echo "Deleting old anchor pods if exists"
echo "Running: ${KUBECONFIG_FOLDER}/../scripts/delete/delete_anchor-pods.sh"
${KUBECONFIG_FOLDER}/../scripts/delete/delete_anchor-pods.sh

sed -e "s/%PEER_ADDRESS%/${PEER_ADDRESS}/g" -e "s/%CHANNEL_NAME%/${CHANNEL_NAME}/g" -e "s/%CHANNEL_PROFILE%/${CHANNEL_PROFILE}/g" -e "s/%PEER_MSPID%/${PEER_MSPID}/g" -e "s|%MSP_CONFIGPATH%|${MSP_CONFIGPATH}|g" -e "s|%CORE_PEER_TLS_KEY_FILE%|${CORE_PEER_TLS_KEY_FILE}|g" -e "s|%CORE_PEER_TLS_CERT_FILE%|${CORE_PEER_TLS_CERT_FILE}|g" -e "s|%CORE_PEER_TLS_ROOTCERT_FILE%|${CORE_PEER_TLS_ROOTCERT_FILE}|g" ${KUBECONFIG_FOLDER}/update_anchor.yaml.base > ${KUBECONFIG_FOLDER}/update_anchor.yaml

echo "Creating updateanchor pod"
echo "Running: kubectl create -f ${KUBECONFIG_FOLDER}/update_anchor.yaml"
kubectl create -f ${KUBECONFIG_FOLDER}/update_anchor.yaml

while [ "$(kubectl get pod updateanchor | grep updateanchor | awk '{print $3}')" != "Completed" ]; do
    echo "Waiting for updateanchor container to be Completed"
    sleep 1;
done

if [ "$(kubectl get pod updateanchor | grep updateanchor | awk '{print $3}')" == "Completed" ]; then
	echo "Create Channel Completed Successfully"
fi

if [ "$(kubectl get pod updateanchor | grep updateanchor | awk '{print $3}')" != "Completed" ]; then
	echo "Create Channel Failed"
  exit 1
fi
