# Bootstrap a BOSH Director on various IaaS & Deploy Concourse

The aim of this repo is to give you a BOSH director and Concourse in the IaaS of your choice.
These are opinionated starting points for using [bbl](https://github.com/cloudfoundry/bosh-bootloader/) to standup a BOSH Director.  
This director is then ready for bosh deployments.   
An example of deploying Concourse is included.  

This is intended to be an extremely fast way of getting a BOSH and Concourse and not for production use.

## TL;DR

**This assumes you have bbl, terraform, git, bosh & direnv already installed**

```
git clone git@github.com:aussielunix/bosh_iaas_bootstrap.git
cd bosh_iaas_bootstrap
cp .envrc-example .envrc
# tune .envrc
direnv allow
bbl up --lb-type=concourse
direnv allow
bosh env
bosh upload-stemcell "${STEMCELL_URL}"

git clone git@github.com:concourse/concourse-bosh-deployment.git

bosh deploy -d concourse concourse-bosh-deployment/cluster/concourse.yml      \
  -l concourse-bosh-deployment/versions.yml                                   \
  -l concourse/aws-vars.yml                                                   \
  -o concourse-bosh-deployment/cluster/operations/basic-auth.yml              \
  -o concourse-bosh-deployment/cluster/operations/privileged-http.yml         \
  -o concourse-bosh-deployment/cluster/operations/web-network-extension.yml   \
  -o concourse-bosh-deployment/cluster/operations/scale.yml                   \
  -o concourse-bosh-deployment/cluster/operations/credhub.yml                 \
  -o concourse-bosh-deployment/cluster/operations/worker-ephemeral-disk.yml

```

:todo: use credhub for basic auth creds
