#!/bin/bash

IFS=',' read -ra CHARTS <<< "$PLUGIN_CHARTS"
for chart in "${CHARTS[@]}"; do
    helm push --username $PLUGIN_USERNAME --password $PLUGIN_PASSWORD $chart $PLUGIN_REPO_URL
done
