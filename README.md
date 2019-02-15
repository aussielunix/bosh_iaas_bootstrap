# Bootstrap a BOSH Director on various IaaS & Deploy Concourse

The aim of this repo is to give you a BOSH director and Concourse in the IaaS of your choice.
These are opinionated starting points for using [bbl](https://github.com/cloudfoundry/bosh-bootloader/) to standup a BOSH Director.  
This director is then ready for bosh deployments.   
An example of deploying Concourse is included.  

This is intended to be an extremely fast way of getting a BOSH and Concourse and not for production use.

*Note:* Credhub namespaces credentials the following way: `/bosh director name/bosh dpeloyment name/credential name.`

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
# Generate some basic auth creds in CredHub
bbl outputs | grep director_name
credhub generate --type user --username admin --name /boshdirector/deploymentname/local_user
./prepare-concourse-deploy.sh
./deploy-concourse-cluster.sh
credhub get -n /boshdirector/deploymentname/local_user

open "$external_url"
fly -t mylab login --concourse-url "$external_url"

# remember to frequently rotate Concourse's basic auth credentials
credhub regenerate --name /boshdirector/deploymentname/local_user
./deploy-concourse-cluster.sh
```
