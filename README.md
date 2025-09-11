# Projet Infra Simple: Vagrant & VirtualBox

Ce projet déploie automatiquement une infrastructure composée de deux machines virtuelles :
- **web-server** (Ubuntu, Nginx, site web)
- **db-server** (CentOS, MySQL, base de données demo)

## Structure du projet

- `Vagrantfile` : Configuration des machines virtuelles
- `scripts/provision-web-ubuntu.sh` : Script d'installation et configuration du serveur web
- `scripts/provision-db-centos.sh` : Script d'installation et configuration du serveur de base de données
- `website/` : Fichiers du site web (HTML, CSS, JS, etc.)
- `database/create-table.sql` : Script SQL pour créer la base et la table `users`
- `database/insert-demo-data.sql` : Script SQL pour insérer des utilisateurs de démonstration

## Prérequis

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

## Installation et utilisation

1. **Cloner le projet**
	 ```bash
	 git clone "https://github.com/Raf-Mos/projet-infra-simple.git"
	 cd projet-infra-simple
	 ```
2. **Lancer l'infrastructure**
	 ```bash
	 vagrant up
	 ```
	 Les deux machines seront créées et provisionnées automatiquement.

3. **Accéder au site web**
	 - Ouvrir un navigateur et entrer l'adresse IP publique affichée par Vagrant pour `web-server`.
	 - Le contenu du dossier `website/` sera servi par Nginx.

4. **Accéder à la base de données**
	 - Utiliser un client MySQL pour se connecter sur `localhost:3307` (port forwardé vers la VM CentOS).
	 - Exemple :
		 ```bash
		 mysql -h 127.0.0.1 -P 3307 -u root
		 ```

## Scripts SQL

- `database/create-table.sql` :
	Crée la base `demo_db` et la table `users`.
- `database/insert-demo-data.sql` :
	Insère 5 utilisateurs de démonstration dans la table `users`.

## Développement du site web

Modifiez les fichiers dans le dossier `website/` sur votre machine hôte. Les changements sont synchronisés automatiquement dans la VM et servis par Nginx.

## Dépannage

- Si une VM ne démarre pas, vérifiez que VirtualBox et Vagrant sont bien installés.
- Pour relancer le provisionnement :
	```bash
	vagrant reload --provision
	```
- Pour accéder à une VM :
	```bash
	vagrant ssh web-server
	vagrant ssh db-server
	```

## Auteur

*Mostafa Rafiki*
