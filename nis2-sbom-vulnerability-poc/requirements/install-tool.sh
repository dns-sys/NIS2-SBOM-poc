#!/usr/bin/env bash
set -euo pipefail

echo "→ Installazione Syft..."
curl -sSfL https://get.anchore.io/syft | sudo sh -s -- -b /usr/local/bin

echo "→ Installazione Grype..."
curl -sSfL https://get.anchore.io/grype | sudo sh -s -- -b /usr/local/bin

echo "Verifica versioni installate:"
syft version  || echo "ATTENZIONE: syft non trovato nel PATH"
grype version || echo "ATTENZIONE: grype non trovato nel PATH"

echo ""
echo "Installazione completata."
echo "Puoi ora usare: syft <immagine> -o cyclonedx-json > sbom.json"
echo "               grype sbom:sbom.json"
