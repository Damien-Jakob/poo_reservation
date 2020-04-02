Ex 3: Système de réservation
============================

L'objectif est de créer un système de gestion d'événements et de réservations de salles et matériel.

Vous devez modéliser (BD et modèle objet) le système complet pour satisfaire aux exigences suivantes:

- Chaque événement aura:
  - Un utilisateur créateur
  - Un utilisateur pour qui a été créé l'événement (facultatif)
  - Une date/heure de début
  - Une date/heure de fin
  - Des utilisateurs participants (facultatif)

- A chaque création, modification ou suppression d'un événement, une notification est envoyée par mail au différents utilisateurs renseignés dans cet événement.

- Les choses réservables sont:
  - Des salles, identifiées par leurs nom
  - Des véhicules. Chacun aura un mode d'emploi (fichier PDF) associé.
  - Du matériel mobilier. Chacun aura une liste de personnes responsables de ces éléments.
  
- Les utilisateurs du système font partie au minimum d'un groupe mais peuveut aussi participer à plusieurs groupes.

- Les choses sont réservables que pour certains groupes (le choix de quelle chose par quel groupe est défini par l'administrateur du système)

- Chaque réservation aura:
  - Un utilisateur opérant la réservation
  - Un utilisateur pour qui a été fait la réservation (facultatif)
  - Une date/heure de début
  - Une date/heure de fin
  - Une ou plusieures choses à réserver
  - Des utilisateurs participants (facultatif)
  
- Il n'est bien sûr pas possible de réserver une chose qui l'est déjà.

- A chaque création, modification ou suppression d'une réservation, une notification est envoyée par mail au différents utilisateurs renseignés dans cette réservation.
  De plus, les responsables de matériel mobiliers seront aussi notifiés.

Votre programme principal démontrera toutes ces fonctionnalités en affichant des messages sur la console (User friendly).
Si vous le désirez, vous pouvez aussi posez des questions de manière interactive (dans la console).

