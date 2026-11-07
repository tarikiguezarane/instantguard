# Journal de progression

Une entrée par jour, la plus récente en haut.

## 2026-11-07 – Jour 1 : structure du dépôt

**Fait**
- Arborescence `generator/`, `streams/`, `ml/`, `api/`, `dashboard/`, `infra/`, `docs/`, `scripts/`, avec un README par dossier (rôle et jour de réalisation).
- README : contexte SEPA Instant (10 s, irrévocable, règlement UE 2024/886) et Wero, fonctionnement cible en 5 étapes, stack. `docs/architecture.md` : schéma, topics Kafka, budget de latence.
- Licence MIT, `.gitignore` multi-langages (Maven, Python, Angular, jeux de données et modèles ML).
- Test `scripts/check-structure.sh` (dossiers obligatoires, aucun `.env`, dataset ou modèle `.onnx`/`.joblib` versionné, licence MIT) et CI : test + shellcheck + yamllint.

**Choix techniques**
- Un dossier par brique et par langage (Python pour la donnée et le ML, Java pour le temps réel) : chaque brique aura sa propre chaîne de build et ses propres tests.
- Modèles et datasets exclus de Git : ils sont régénérés à partir du générateur, ce qui garantit qu'aucune donnée réelle n'entre dans le dépôt et que l'entraînement reste reproductible.
- Topics nommés par étape du flux (`pacs008.in` → `tx.normalized` → `decisions` / `alerts`) pour pouvoir rejouer chaque étape séparément.

**À retenir pour un entretien**
- Virement instantané = irrévocable : la fraude doit être bloquée *avant* l'exécution, d'où le temps réel (Kafka Streams) plutôt qu'un traitement par lots.
- pacs.008 = virement client à client entre banques (ISO 20022) ; pacs.002 = rapport de statut (accepté / rejeté).

**Limites connues**
- Aucun code applicatif : Kafka arrive au jour 2, le parsing pacs.008 au jour 3.
- Tests et lint validés localement ; la CI GitHub reste à observer.

## 2026-11-07 – Jour 0 : lancement

- Création du dépôt, de la feuille de route sur 30 jours (`ROADMAP.md`) et des instructions de travail quotidien (`CLAUDE.md`).
- Prochaine étape : Jour 1.
