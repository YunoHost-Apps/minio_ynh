# MinIO server pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/minio.svg)](https://dash.yunohost.org/appci/app/minio) ![](https://ci-apps.yunohost.org/ci/badges/minio.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/minio.maintain.svg)  
[![Installer MinIO server avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=minio)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer MinIO server rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

MinIO is a High Performance Object Storage released under GNU Affero General Public License v3.0. It is API compatible with Amazon S3 cloud storage service. Use MinIO to build high performance infrastructure for machine learning, analytics and application data workloads.


**Version incluse :** 2022.01.28~ynh2



## Captures d'écran

![](./doc/screenshots/minio-browser.jpg)

## Documentations et ressources

* Site officiel de l'app : https://min.io
* Documentation officielle de l'admin : https://docs.min.io/
* Dépôt de code officiel de l'app : https://github.com/minio/minio
* Documentation YunoHost pour cette app : https://yunohost.org/app_minio
* Signaler un bug : https://github.com/YunoHost-Apps/minio_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/minio_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
ou
sudo yunohost app upgrade minio -u https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps