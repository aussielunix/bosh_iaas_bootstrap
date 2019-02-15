#!/bin/bash

cat > concourse/settings.yml <<EOL
external_url: "http://$EXTERNAL_HOST"
credhub_url: "$CREDHUB_SERVER"
credhub_client_id: "$CREDHUB_CLIENT"
credhub_client_secret: "$CREDHUB_SECRET"
credhub_ca_cert: "$CREDHUB_CA_CERT"
EOL
