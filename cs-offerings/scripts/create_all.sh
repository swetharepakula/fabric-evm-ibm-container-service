#!/bin/bash

if [ "${PWD##*/}" == "create" ]; then
	:
elif [ "${PWD##*/}" == "scripts" ]; then
	:
else
    echo "Please run the script from 'scripts' or 'scripts/create' folder"
fi

echo ""
echo "=> CREATE_ALL: Creating storage"
create/create_storage.sh $@

echo ""
echo "=> CREATE_ALL: Creating blockchain"
create/create_blockchain.sh $@

echo ""
echo "=> CREATE_ALL: Running Create Channel: channela"
PEER_MSPID="Org1MSP" CHANNEL_NAME="channela" CHANNEL_PROFILE="TwoOrgs12Channel" PEER_ADDRESS="blockchain-org1peer0:30110" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.crt" create/create_channel.sh

echo ""
echo "=> CREATE_ALL: Running Create Channel: channelb"
PEER_MSPID="Org3MSP" CHANNEL_NAME="channelb" CHANNEL_PROFILE="TwoOrgs34Channel" PEER_ADDRESS="blockchain-org3peer0:30110" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.crt" create/create_channel.sh

echo ""
echo "=> CREATE_ALL: Running Create Channel: channelc"
PEER_MSPID="Org1MSP" CHANNEL_NAME="channelc" CHANNEL_PROFILE="FourOrgsChannel" PEER_ADDRESS="blockchain-org1peer0:30110" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.crt" create/create_channel.sh

echo ""
echo "=> CREATE_ALL: Running Join channela on Org1 Peer0"
CHANNEL_NAME="channela" PEER_MSPID="Org1MSP" PEER_ADDRESS="blockchain-org1peer0:30110" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.crt" create/join_channel.sh

echo ""
echo "=> CREATE_ALL: Running Join channela on Org2 Peer0"
CHANNEL_NAME="channela" PEER_MSPID="Org2MSP" PEER_ADDRESS="blockchain-org2peer0:30210" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/server.crt" create/join_channel.sh

echo ""
echo "=> CREATE_ALL: Running Join channelb on Org3 Peer0"
CHANNEL_NAME="channelb" PEER_MSPID="Org3MSP" PEER_ADDRESS="blockchain-org3peer0:30310" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.crt" create/join_channel.sh

echo ""
echo "=> CREATE_ALL: Running Join channelb on Org4 Peer0"
CHANNEL_NAME="channelb" PEER_MSPID="Org4MSP" PEER_ADDRESS="blockchain-org4peer0:30410" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/server.crt" create/join_channel.sh

echo ""
echo "=> CREATE_ALL: Running Join channelc on Org1 Peer0"
CHANNEL_NAME="channelc" PEER_MSPID="Org1MSP" PEER_ADDRESS="blockchain-org1peer0:30110" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.crt" create/join_channel.sh

echo ""
echo "=> CREATE_ALL: Running Join channelc on Org2 Peer0"
CHANNEL_NAME="channelc" PEER_MSPID="Org2MSP" PEER_ADDRESS="blockchain-org2peer0:30210" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/server.crt" create/join_channel.sh

echo ""
echo "=> CREATE_ALL: Running Join channelc on Org3 Peer0"
CHANNEL_NAME="channelc" PEER_MSPID="Org3MSP" PEER_ADDRESS="blockchain-org3peer0:30310" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.crt" create/join_channel.sh

echo ""
echo "=> CREATE_ALL: Running Join channelc on Org4 Peer0"
CHANNEL_NAME="channelc" PEER_MSPID="Org4MSP" PEER_ADDRESS="blockchain-org4peer0:30410" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/server.crt" create/join_channel.sh

echo ""
echo "=> CREATE_ALL: Running Update Anchor channelc on Org1 Peer0"
CHANNEL_NAME="channelc" CHANNEL_PROFILE="FourOrgsChannel" PEER_MSPID="Org1MSP" PEER_ADDRESS="blockchain-org1peer0:30110" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.crt" create/update_channel_anchor.sh

echo ""
echo "=> CREATE_ALL: Running Update Anchor channelc on Org2 Peer0"
CHANNEL_NAME="channelc" CHANNEL_PROFILE="FourOrgsChannel" PEER_MSPID="Org2MSP" PEER_ADDRESS="blockchain-org2peer0:30210" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/server.crt" create/update_channel_anchor.sh

echo ""
echo "=> CREATE_ALL: Running Update Anchor channelc on Org3 Peer0"
CHANNEL_NAME="channelc" CHANNEL_PROFILE="FourOrgsChannel" PEER_MSPID="Org3MSP" PEER_ADDRESS="blockchain-org3peer0:30310" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.crt" create/update_channel_anchor.sh

echo ""
echo "=> CREATE_ALL: Running Update Anchor channelc on Org4 Peer0"
CHANNEL_NAME="channelc" CHANNEL_PROFILE="FourOrgsChannel" PEER_MSPID="Org4MSP" PEER_ADDRESS="blockchain-org4peer0:30410" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/server.crt" create/update_channel_anchor.sh

echo ""
echo "=> CREATE_ALL: Running Install Chaincode on Org1 Peer1"
CHAINCODE_NAME="evmcc" CHAINCODE_VERSION="v1" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp"  PEER_MSPID="Org1MSP" PEER_ADDRESS="blockchain-org1peer0:30110" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.crt" create/chaincode_install.sh

echo ""
echo "=> CREATE_ALL: Running Install Chaincode on Org2 Peer1"
CHAINCODE_NAME="evmcc" CHAINCODE_VERSION="v1" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp"  PEER_MSPID="Org2MSP" PEER_ADDRESS="blockchain-org2peer0:30210" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org2.example.com/peers/blockchain-org2peer0.org2.example.com/tls/server.crt" create/chaincode_install.sh


echo ""
echo "=> CREATE_ALL: Running Install Chaincode on Org3 Peer1"
CHAINCODE_NAME="evmcc" CHAINCODE_VERSION="v1" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp"  PEER_MSPID="Org3MSP" PEER_ADDRESS="blockchain-org3peer0:30310" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.crt" create/chaincode_install.sh

echo ""
echo "=> CREATE_ALL: Running Install Chaincode on Org4 Peer1"
CHAINCODE_NAME="evmcc" CHAINCODE_VERSION="v1" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp"  PEER_MSPID="Org4MSP" PEER_ADDRESS="blockchain-org4peer0:30410" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org4.example.com/peers/blockchain-org4peer0.org4.example.com/tls/server.crt" create/chaincode_install.sh

echo ""
echo "=> CREATE_ALL: Running instantiate chaincode on channel \"channela\" using \"Org1MSP\""
CHANNEL_NAME="channela" CHAINCODE_NAME="evmcc" CHAINCODE_VERSION="v1" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp"  PEER_MSPID="Org1MSP" PEER_ADDRESS="blockchain-org1peer0:30110" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.crt" create/chaincode_instantiate.sh

echo ""
echo "=> CREATE_ALL: Running instantiate chaincode on channel \"channelb\" using \"Org3MSP\""
CHANNEL_NAME="channelb" CHAINCODE_NAME="evmcc" CHAINCODE_VERSION="v1" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp"  PEER_MSPID="Org3MSP" PEER_ADDRESS="blockchain-org3peer0:30310" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org3.example.com/peers/blockchain-org3peer0.org3.example.com/tls/server.crt" create/chaincode_instantiate.sh

echo ""
echo "=> CREATE_ALL: Running instantiate chaincode on channel \"channelc\" using \"Org1MSP\""
CHANNEL_NAME="channelc" CHAINCODE_NAME="evmcc" CHAINCODE_VERSION="v1" MSP_CONFIGPATH="/shared/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp"  PEER_MSPID="Org1MSP" PEER_ADDRESS="blockchain-org1peer0:30110" CORE_PEER_TLS_ROOTCERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/ca.crt" CORE_PEER_TLS_KEY_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.key" CORE_PEER_TLS_CERT_FILE="/shared/crypto-config/peerOrganizations/org1.example.com/peers/blockchain-org1peer0.org1.example.com/tls/server.crt" create/chaincode_instantiate.sh
