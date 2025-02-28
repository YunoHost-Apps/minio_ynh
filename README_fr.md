<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# MinIO pour YunoHost

[![Niveau d’intégration](https://apps.yunohost.org/badge/integration/minio)](https://ci-apps.yunohost.org/ci/apps/minio/)
![Statut du fonctionnement](https://apps.yunohost.org/badge/state/minio)
![Statut de maintenance](https://apps.yunohost.org/badge/maintained/minio)

[![Installer MinIO avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=minio)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer MinIO rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

MinIO est un système de stockage objet haute performance. Il est compatible avec l'API du service de stockage en nuage Amazon S3. Utilisez MinIO pour construire une infrastructure haute performance pour l'apprentissage automatique, l'analyse et les charges de travail de données d'application.

## Comment créer une application YunoHost à l'aide de MinIO
Au cours du processus d'installation, MinIO installera à la fois le serveur MinIO et le client MinIO.
Si votre application a besoin d'utiliser un stockage Amazon S3, je vous recommande d'utiliser le client MinIO pour créer et configurer les buckets en fonction des besoins de votre application. Vous pouvez consulter l'application outline_ynh à titre de référence.

### Première étape : récupérer les informations d'identification MinIO
```
#=================================================
# SETUP MINIO CREDENTIALS
#=================================================
minio_domain=$(ynh_app_setting_get --app="minio" --key=domain)
minio_admin=$(ynh_app_setting_get --app="minio" --key=admin)
minio_password=$(ynh_app_setting_get --app="minio" --key=password)
mc_path=$(ynh_app_setting_get --app="minio" --key=mc_path)
```

### Deuxième étape : créer et configurer votre bucket
```
#=================================================
# SETUP MINIO BUCKET
#=================================================
ynh_script_progression --message="Configuration du seau MinIO pour YOURAPP... » --weight=1

pushd "$mc_path »
	ynh_exec_warn_less sudo -u minio ./mc mb minio/NAME_OF_YOUR_BUCKET --region "NAME_OF_YOUR_REGION"
	ynh_exec_warn_less sudo -u minio ./mc policy set NEEDED_POLICY minio/NAME_OF_YOUR_BUCKET
popd
```

**Version incluse :** 2025.02.18~ynh1

## Captures d’écran

![Capture d’écran de MinIO](./doc/screenshots/minio-browser.png)

## Documentations et ressources

- Site officiel de l’app : <https://min.io>
- Documentation officielle de l’admin : <https://docs.min.io/>
- Dépôt de code officiel de l’app : <https://github.com/minio/minio>
- YunoHost Store : <https://apps.yunohost.org/app/minio>
- Signaler un bug : <https://github.com/YunoHost-Apps/minio_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/minio_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
ou
sudo yunohost app upgrade minio -u https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
