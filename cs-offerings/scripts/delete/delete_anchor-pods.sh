
#!/bin/bash

if [ "${PWD##*/}" == "delete" ]; then
    KUBECONFIG_FOLDER=${PWD}/../../kube-configs
elif [ "${PWD##*/}" == "scripts" ]; then
    KUBECONFIG_FOLDER=${PWD}/../kube-configs
else
    echo "Please run the script from 'scripts' or 'scripts/delete' folder"
fi

# The env variables don't matter as we are deleting pods
PEER_ADDRESS="DoesntMatter"
CHANNEL_NAME="DoesntMatter"
PEER_MSPID="DoesntMatter"
MSP_CONFIG_PATH="DoesntMatter"
CORE_PEER_TLS_KEY_FILE="DoesntMatter"
CORE_PEER_TLS_CERT_FILE="DoesntMatter"
CORE_PEER_TLS_ROOTCERT_FILE="DoesntMatter"
# Delete Anchor Pod

echo "Preparing yaml for updateanchor pod for deletion"
sed -e "s/%PEER_ADDRESS%/${PEER_ADDRESS}/g" -e "s/%CHANNEL_NAME%/${CHANNEL_NAME}/g" -e "s/%CHANNEL_PROFILE%/${CHANNEL_PROFILE}/g" -e "s/%PEER_MSPID%/${PEER_MSPID}/g" -e "s|%MSP_CONFIGPATH%|${MSP_CONFIGPATH}|g" -e "s|%CORE_PEER_TLS_KEY_FILE%|${CORE_PEER_TLS_KEY_FILE}|g" -e "s|%CORE_PEER_TLS_CERT_FILE%|${CORE_PEER_TLS_CERT_FILE}|g" -e "s|%CORE_PEER_TLS_ROOTCERT_FILE%|${CORE_PEER_TLS_ROOTCERT_FILE}|g" ${KUBECONFIG_FOLDER}/update_anchor.yaml.base > ${KUBECONFIG_FOLDER}/update_anchor.yaml

echo "Deleting Existing Update Anchor Pod"
if [ "$(kubectl get pods | grep updateanchor | wc -l | awk '{print $1}')" != "0" ]; then
	echo "Running: kubectl delete -f ${KUBECONFIG_FOLDER}/update_anchor.yaml"
    kubectl delete -f ${KUBECONFIG_FOLDER}/update_anchor.yaml

    # Wait for the pod to be deleted
    while [ "$(kubectl get pods | grep updateanchor | wc -l | awk '{print $1}')" != "0" ]; do
        echo "Waiting for old Update Anchor Pod to be deleted"
        sleep 1;
    done

    echo "Update anchor pod deleted successfully."
else
    echo "updateanchor pod doesn't exist. No need to delete."
fi

