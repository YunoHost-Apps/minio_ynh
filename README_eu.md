<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# MinIO server YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/minio.svg)](https://dash.yunohost.org/appci/app/minio) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/minio.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/minio.maintain.svg)

[![Instalatu MinIO server YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=minio)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek MinIO server YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

MinIO is a High Performance Object Storage released under GNU Affero General Public License v3.0. It is API compatible with Amazon S3 cloud storage service. Use MinIO to build high performance infrastructure for machine learning, analytics and application data workloads.

## How to create a Yunohost app using MinIO
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

**Paketatutako bertsioa:** 2023.09.07~ynh1

## Pantaila-argazkiak

![MinIO server(r)en pantaila-argazkia](./doc/screenshots/minio-browser.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://min.io>
- Administratzaileen dokumentazio ofiziala: <https://docs.min.io/>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/minio/minio>
- YunoHost Denda: <https://apps.yunohost.org/app/minio>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/minio_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/minio_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
edo
sudo yunohost app upgrade minio -u https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
