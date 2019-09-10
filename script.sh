#!/bin/bash

status=0
IFS=',' read -ra CHARTS <<< "$PLUGIN_CHARTS"
for chart in "${CHARTS[@]}"; do
    # swallow 409 conflict error for idempotent POST-ing to
    # existing resource.
    if ! helm push $chart $PLUGIN_REPO_URL 2>&1 | grep -iEq "Error: 409|Done"; then
        status=1
    fi
done

exit $status
