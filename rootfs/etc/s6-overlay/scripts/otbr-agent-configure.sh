#!/usr/bin/with-contenv bash
# ==============================================================================
# Configure OTBR depending on add-on settings
# ==============================================================================
source /etc/bashlog/log.sh;

declare otbr_nat64

if  [[ -z "${OTBR_NAT64}" ]]; then
    export OTBR_NAT64="false"
fi
otbr_nat64=$OTBR_NAT64
if [ "$otbr_nat64" = true ] ; then
    log 'info' "Enabling NAT64."
    ot-ctl nat64 enable
    ot-ctl dns server upstream enable
fi

# To avoid asymmetric link quality the TX power from the controller should not
# exceed that of what other Thread routers devices typically use.
ot-ctl txpower 6
