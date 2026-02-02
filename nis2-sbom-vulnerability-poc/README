# NIS2 SBOM & Vulnerability PoC

**PoC**: Generazione SBOM e scansione vulnerabilità per supportare misure ACN/NIS2  
(asset inventory + supply chain risk + vulnerability management)

**Abstract (English)**  
Simple Proof-of-Concept using open-source tools (Syft + Grype) to generate a CycloneDX SBOM from a Docker image and scan it for vulnerabilities. The workflow supports key NIS2/ACN requirements for Important/Essential Entities in Italy (D.lgs. 138/2024 + Determinazione ACN 379907/2025 Allegato 1), focusing on asset management, supply-chain risk assessment and vulnerability identification.

## Obiettivo e contesto normativo

Il D.lgs. 138/2024 recepisce la Direttiva (UE) 2022/2555 (NIS2). La Determinazione ACN n. 379907 del 18 dicembre 2025 (in vigore dal 15 gennaio 2026) definisce le misure di sicurezza di base (Allegato 1 per soggetti importanti, Allegato 2 per essenziali).  
Questo PoC mostra un workflow leggero per:
- generare **SBOM** (Software Bill of Materials) → inventario automatico componenti software
- scansionare vulnerabilità note → supporto a identificazione rischi

**Valore per aziende soggette NIS2**  
Automatizza l'inventario asset (riduce effort audit manuale), rende trasparente la supply chain (facilita valutazione fornitori), fornisce evidenze concrete per gestione vulnerabilità – tutto con tool gratuiti e in poche ore.

## Misure ACN supportate dal workflow SBOM + Grype

| Misura ACN (Allegato 1 Determinazione 379907/2025) | Descrizione breve                              | Come SBOM + tool lo supporta                                                                 | Ambito politico (GV.PO-01) |
|-----------------------------------------------------|------------------------------------------------|-----------------------------------------------------------------------------------------------|-----------------------------|
| f) Gestione degli asset (ID.AM-01 / ID.AM-02)      | Inventario aggiornato di asset e software      | Syft genera SBOM CycloneDX → elenco esaustivo componenti, versioni, dipendenze (ID.AM-02)     | Sì                         |
| e) Gestione rischi catena approvvigionamento (GV.SC-05 / GV.SC-07) | Requisiti sicurezza nei contratti + valutazione rischio fornitori/prodotti | SBOM documenta componenti di terze parti → base per valutazione rischio prodotto (GV.SC-07) e clausole contrattuali (GV.SC-05) | Sì                         |
| g) Gestione vulnerabilità (ID.RA-01 / ID.RA-08)    | Identificazione, analisi e risposta a vulnerabilità note | Grype scansiona SBOM → report CVE con severità → supporta ID.RA-01 (identif.) e ID.RA-08 (priorizzazione/risposta) | Sì                         |
| e) Gestione rischi catena approvvigionamento (GV.SC-01 / GV.SC-02) | Politiche e processi per rischi supply chain   | SBOM + scansione periodica → aiuta a definire e monitorare rischi fornitori (GV.SC-01/02)    | Sì                         |
| g) Gestione vulnerabilità (ID.RA-05 / ID.RA-06)    | Analisi rischi vulnerabilità + monitoraggio    | Report Grype fornisce dati per analisi rischi (severità, exploitability) e monitoraggio continuo | Sì                         |

## Requisiti e installazione tool

Requisiti:
- Docker funzionante
- bash
- curl

Installazione Syft + Grype (metodo ufficiale Anchore):

```bash
curl -sSfL https://get.anchore.io/syft  | sudo sh -s -- -b /usr/local/bin
curl -sSfL https://get.anchore.io/grype | sudo sh -s -- -b /usr/local/bin

syft version
grype version
