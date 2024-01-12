# VoteTopServeur-QB
### Voici un script pour récupéré IP + Pseudo du vote via https://top-serveurs.net/.

1. Oublier pas d'**aller sur le site** __https://top-serveurs.net/ > Mes serveurs GTA > Mon Serveur > Plugin de vote (tout en bas)__
2. **Récupérer le "Port du plugin de vote"**, qui est `8192` par défaut normalement
3. **Vous devez aller dans votre** `Pare-feu Windows Defender avec fonctions avancées de sécurité` > `Règles de trafic entrant > Nouvelle règle` > `Port` > `UDP` > `Écrivez le port du plugin de vote` > `Autoriser la connexion` > `Cochez Domaine, Privé, Public` > et `ajoutez un nom "TopServeurVote"`.

Ensuite dans votre server.cfg
```cfg
ensure VoteTopServeur
set vote_token "XXXXXXXXXXXXXXXX" # La token est obligatoire. C'est la token de votre fiche serveur disponible sur votre panel : https://top-serveurs.net/gta/server/68780#voteToken
set vote_port "8192" # Le port d'écoute du plugin. Par défaut, c'est le port 8192 mais vous pouvez spécifier celui que vous voulez. N'oubliez pas de le configurer aussi dans le formulaire ci-dessous.
```
![image](https://github.com/skypr0d/VoteTopServeur-QB/assets/67479263/2df0f5a1-ae5d-48db-86aa-9d3c6bb39fa5)

Cliquer sur `Documentation` pour voir votre le `cfg` avec le `vote_token`.

> N'oubliez pas de redémarrer votre serveur pour que les modifications du `server.cfg` prennent effet.
> La version ESX est disponible dans l'onglet Documentation, mais la QBCore ne l'est pas, d'où cette création faite par moi-même.

> #### *Voici mon discord : https://discord.gg/EyT4mt8Pwf. Les seules aides que je propose par rapport à ce script seront des corrections et non des ajouts (sauf si c'est important). C'est un script open-source, donc vous devez avoir la connaissance pour le modifier.*
