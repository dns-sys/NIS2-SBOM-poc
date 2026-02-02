#!/usr/bin/env bash
set -euo pipefail

IMAGE="${1:-node:14-alpine}"
OUTPUT_DIR="${2:-examples/scans}"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
SBOM_FILE="${OUTPUT_DIR}/sbom-${TIMESTAMP}.json"
REPORT_FILE="${OUTPUT_DIR}/grype-report-${TIMESTAMP}.txt"

echo "======================================"
echo " NIS2 PoC - SBOM + Vulnerability Scan"
echo " Immagine target : ${IMAGE}"
echo " Output in       : ${OUTPUT_DIR}"
echo "======================================"

mkdir -p "${OUTPUT_DIR}"

syft "${IMAGE}" -o cyclonedx-json > "${SBOM_FILE}"

if [[ ! -s "${SBOM_FILE}" ]]; then
  echo "ERRORE: SBOM vuoto o non generato!"
  exit 1
fi

echo "   SBOM salvato in: ${SBOM_FILE}"

grype "sbom:${SBOM_FILE}" --output table > "${REPORT_FILE}"

echo ""
echo "Report completo: ${REPORT_FILE}"
echo "======================================"
