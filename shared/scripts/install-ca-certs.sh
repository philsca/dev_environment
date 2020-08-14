#!/bin/bash
CERT_SOURCE_PATH=~/shared/certificates

CA_CERT_FILE=nhsbsa_aws_ca_2019-2029.pem
INT_CERT_FILE=nhsbsa_aws_int_ca_2019-2024.pem
CA_ALIAS=nhsbsa.aws.root.ca.cert.pem
INT_ALIAS=nhsbsa.aws.int.ca.cert.pem
#CERT_STAGING_PATH=/usr/share/pki/ca-trust-source
CERT_STAGING_PATH=/etc/pki/ca-trust/source/anchors

sudo update-ca-trust enable
# copy certs to staging dir
sudo cp $CERT_SOURCE_PATH/$CA_CERT_FILE   $CERT_STAGING_PATH
sudo cp $CERT_SOURCE_PATH/$INT_CERT_FILE  $CERT_STAGING_PATH
sudo update-ca-trust extract

#
# Extract jdk install path
java_home_path=$(dirname $(dirname $(readlink -f $(which javac))))
# ... and path to java keytool and trust store
java_keytool="$java_home_path/bin/keytool"
java_truststore="$java_home_path/jre/lib/security/cacerts"

# TODO - backup existing cert file?

# remove any existing aliases and add certs
#sudo $java_keytool  -delete -alias $CA_ALIAS  -keystore $java_truststore
#sudo $java_keytool  -delete -alias $INT_ALIAS -keystore $java_truststore
sudo $java_keytool  -importcert -file $CERT_SOURCE_PATH/$CA_CERT_FILE  -keystore $java_truststore -alias $CA_ALIAS
sudo $java_keytool  -importcert -file $CERT_SOURCE_PATH/$INT_CERT_FILE -keystore $java_truststore -alias $INT_ALIAS

