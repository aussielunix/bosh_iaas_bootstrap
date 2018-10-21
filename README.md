# Bootstrap BOSH Director on various IaaS

These are opinionated starting points for using [bbl](https://github.com/cloudfoundry/bosh-bootloader/) to standup a BOSH Director.

See my [documentation](https://bosh.valueline.io/bootstrap-bosh-director/) on using these starting points.

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

