# Feuille de route – InstantGuard (30 jours)

**Profil visé : Monétique.** Détection de fraude en temps réel pour les virements SEPA Instant et Wero.
Un virement instantané est irrévocable : la décision (accepter, examiner, rejeter) doit tomber en moins de 10 secondes.

Stack : Java 21 + Kafka Streams (Maven), Python (générateur, scikit-learn), ONNX Runtime, Spring Boot (API),
Angular (tableau de bord), OpenTelemetry, Prometheus, Grafana, Jaeger ou Tempo, Docker Compose, GitHub Actions.

Règle : chaque jour, faire la première étape non cochée, puis la cocher. Une étape = un incrément qui marche et qui est testé.
Uniquement des données synthétiques (IBAN de test, aucune donnée réelle).

## Semaine 1 – Flux ISO 20022 et règles
- [x] Jour 1 – Structure : `generator/` (Python), `streams/` (Kafka Streams), `ml/`, `api/`, `dashboard/`, `infra/`, licence MIT, README (contexte SEPA Instant / Wero).
- [ ] Jour 2 – Docker Compose : Kafka en mode KRaft, création des topics (`pacs008.in`, `tx.normalized`, `decisions`, `alerts`).
- [ ] Jour 3 – Modèle pacs.008 (sous-ensemble utile) : parsing et validation XML + tests sur messages d'exemple.
- [ ] Jour 4 – Générateur Python : flux réalistes de virements, avec des schémas de fraude injectés et étiquetés.
- [ ] Jour 5 – Application Kafka Streams : lecture du pacs.008, normalisation, tests avec TopologyTestDriver.
- [ ] Jour 6 – Règle 1 : vitesse (nombre de virements par débiteur sur fenêtre glissante).
- [ ] Jour 7 – Règle 2 : nouveau bénéficiaire (KTable des couples connus) combinée au montant.

## Semaine 2 – Score ML et décision
- [ ] Jour 8 – Règle 3 : montant anormal (statistiques glissantes par client, z-score).
- [ ] Jour 9 – Moteur de décision : combinaison des règles, décision ACCEPT / REVIEW / REJECT, statut de type pacs.002.
- [ ] Jour 10 – ML : extraction des caractéristiques à partir des données générées.
- [ ] Jour 11 – ML : entraînement Isolation Forest, évaluation (précision, rappel), export ONNX.
- [ ] Jour 12 – Inférence ONNX dans Kafka Streams.
- [ ] Jour 13 – Décision combinée règles + score ML, mesure de la latence (p50, p99, objectif < 10 s).
- [ ] Jour 14 – Scénarios de test TopologyTestDriver pour chaque schéma de fraude.

## Semaine 3 – Observabilité et tableau de bord
- [ ] Jour 15 – OpenTelemetry : propagation du contexte dans les en-têtes Kafka, du générateur jusqu'à la décision.
- [ ] Jour 16 – OTel Collector + Jaeger ou Tempo dans le compose.
- [ ] Jour 17 – Métriques : histogramme de latence de décision, Prometheus + tableau de bord Grafana.
- [ ] Jour 18 – API Spring Boot de lecture des alertes et décisions.
- [ ] Jour 19 – Tableau de bord Angular : alertes en temps réel (SSE).
- [ ] Jour 20 – Tableau de bord : détail d'un virement, règles déclenchées, score ML expliqué.
- [ ] Jour 21 – Tableau de bord : statistiques (volume, taux de rejet, latence).

## Semaine 4 – Robustesse et finition
- [ ] Jour 22 – Dockerfiles + GitHub Actions (Java, Python, Angular).
- [ ] Jour 23 – Test de charge à 1 000 virements/s et rapport de latence.
- [ ] Jour 24 – Exactly-once, gestion des erreurs, dead letter queue.
- [ ] Jour 25 – Suivi du modèle : métriques de dérive, script de réentraînement.
- [ ] Jour 26 – Sécurité : Kafka en SASL/TLS dans le compose, masquage des IBAN dans les logs.
- [ ] Jour 27 – Contexte réglementaire : règlement UE 2024/886 (virements instantanés), vérification du bénéficiaire (VoP), Wero / EPI.
- [ ] Jour 28 – Documentation d'architecture (Mermaid).
- [ ] Jour 29 – README final : badges, démarrage rapide, résultats de performance.
- [ ] Jour 30 – Release v1.0.0 : CHANGELOG, tag Git, bilan dans le journal.
