# Instructions pour la session quotidienne

Ce dépôt fait partie d'un portfolio de 4 projets de Tarik Iguezarane (élève-ingénieur ENSICAEN, cybersécurité & e-paiement) :
`vulntrack` (full-stack), `securepipeline` (DevSecOps, déploie VulnTrack), `miniswitch` et `instantguard` (monétique).
Il avance d'une étape par jour, en autonomie, pendant 30 jours.

1. Lire `ROADMAP.md` et `JOURNAL.md`. L'étape du jour est la première case non cochée.
2. Si toutes les cases sont cochées : ne rien modifier, le projet est terminé.
3. Si la CI de `main` est en échec, réparer d'abord, puis faire l'étape du jour si le temps le permet.
4. Réaliser l'étape : code propre, typé, commenté là où c'est utile, avec des tests. Lancer les tests et le lint localement.
   Si Docker ou un outil n'est pas disponible dans l'environnement, écrire quand même le code et les fichiers d'infra,
   valider ce qui peut l'être (tests unitaires, syntaxe) et laisser la CI GitHub Actions faire le reste.
5. Commits petits et clairs, au format Conventional Commits (`feat:`, `test:`, `ci:`, `docs:`, `fix:`).
6. Cocher l'étape dans `ROADMAP.md` et ajouter une entrée en haut de `JOURNAL.md` :
   date, étape, ce qui a été fait, choix techniques et pourquoi, points à retenir pour un entretien, limites connues.
7. Pousser sur `main` (`git fetch origin main` puis rebase avant de pousser).

Règles : code, commentaires et README en anglais ; `ROADMAP.md` et `JOURNAL.md` en français.
Jamais de secret, de vraie donnée de carte, d'IBAN réel ou de donnée personnelle dans le dépôt : uniquement des données de test.
Ne pas réécrire l'historique (pas de force push). Une seule étape par jour.
