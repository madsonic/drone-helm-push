#!/bin/bash

IFS=',' read -ra CHARTS <<< "$PLUGIN_CHARTS"
for chart in "${CHARTS[@]}"; do
    helm push $chart $PLUGIN_REPO_URL
done
