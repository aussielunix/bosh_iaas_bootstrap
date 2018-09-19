# Bootstrap BOSH Director on various IaaS

## TL;DR

```
git clone git@github.com:aussielunix/bosh_iaas_bootstrap.git
cd bosh_iaas_bootstrap/aws
cp .envrc.example .envrc
source .envrc
bbl up
eval "$(bbl print-env)"
bosh env
```

