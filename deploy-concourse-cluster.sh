#!/bin/bash

set -e

bosh deploy -d concourse concourse-bosh-deployment/cluster/concourse.yml      \
  -l concourse-bosh-deployment/versions.yml                                   \
  -l concourse/settings.yml                                                   \
  -l concourse/aws-vars.yml                                                   \
  -o concourse-bosh-deployment/cluster/operations/basic-auth.yml              \
  -o concourse-bosh-deployment/cluster/operations/privileged-http.yml         \
  -o concourse-bosh-deployment/cluster/operations/web-network-extension.yml   \
  -o concourse-bosh-deployment/cluster/operations/scale.yml                   \
  -o concourse-bosh-deployment/cluster/operations/credhub.yml                 \
  -o concourse-bosh-deployment/cluster/operations/worker-ephemeral-disk.yml
