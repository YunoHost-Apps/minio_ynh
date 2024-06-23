<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# MinIO server para Yunohost

[![Nivel de integración](https://dash.yunohost.org/integration/minio.svg)](https://dash.yunohost.org/appci/app/minio) ![Estado funcional](https://ci-apps.yunohost.org/ci/badges/minio.status.svg) ![Estado En Mantención](https://ci-apps.yunohost.org/ci/badges/minio.maintain.svg)

[![Instalar MinIO server con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=minio)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarMinIO server rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

MinIO is a High Performance Object Storage released under GNU Affero General Public License v3.0. It is API compatible with Amazon S3 cloud storage service. Use MinIO to build high performance infrastructure for machine learning, analytics and application data workloads.

## How to create a YunoHost app using MinIO

During the install process, MinIO will install both the MinIO server and MinIO client.
If your app needs to use an Amazon S3 storage, I recommend to use the MinIO client to create and setup buckets as per your app's requirements. You can have a look at outline_ynh app for reference.

### First step: retrieve MinIO credentials
```
#=================================================
# SETUP MINIO CREDENTIALS
#=================================================
minio_domain=$(ynh_app_setting_get --app="minio" --key=domain)
minio_admin=$(ynh_app_setting_get --app="minio" --key=admin)
minio_password=$(ynh_app_setting_get --app="minio" --key=password)
mc_path=$(ynh_app_setting_get --app="minio" --key=mc_path)
```

### Second step: create and setup your bucket
```
#=================================================
# SETUP MINIO BUCKET
#=================================================
ynh_script_progression --message="Setting up MinIO bucket for YOURAPP..." --weight=1

pushd "$mc_path"
	ynh_exec_warn_less sudo -u minio ./mc mb minio/NAME_OF_YOUR_BUCKET --region "NAME_OF_YOUR_REGION"
	ynh_exec_warn_less sudo -u minio ./mc policy set NEEDED_POLICY minio/NAME_OF_YOUR_BUCKET
popd
```

**Versión actual:** 2023.09.07~ynh2

## Capturas

![Captura de MinIO server](./doc/screenshots/minio-browser.png)

## Documentaciones y recursos

- Sitio web oficial: <https://min.io>
- Documentación administrador oficial: <https://docs.min.io/>
- Repositorio del código fuente oficial de la aplicación : <https://github.com/minio/minio>
- Catálogo YunoHost: <https://apps.yunohost.org/app/minio>
- Reportar un error: <https://github.com/YunoHost-Apps/minio_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [`branch testing`](https://github.com/YunoHost-Apps/minio_ynh/tree/testing

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
o
sudo yunohost app upgrade minio -u https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
