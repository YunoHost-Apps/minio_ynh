<!--
To README zostało automatycznie wygenerowane przez <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Nie powinno być ono edytowane ręcznie.
-->

# MinIO dla YunoHost

[![Poziom integracji](https://apps.yunohost.org/badge/integration/minio)](https://ci-apps.yunohost.org/ci/apps/minio/)
![Status działania](https://apps.yunohost.org/badge/state/minio)
![Status utrzymania](https://apps.yunohost.org/badge/maintained/minio)

[![Zainstaluj MinIO z YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=minio)

*[Przeczytaj plik README w innym języku.](./ALL_README.md)*

> *Ta aplikacja pozwala na szybką i prostą instalację MinIO na serwerze YunoHost.*  
> *Jeżeli nie masz YunoHost zapoznaj się z [poradnikiem](https://yunohost.org/install) instalacji.*

## Przegląd

MinIO is a High Performance Object Storage. It is API compatible with Amazon S3 cloud storage service. Use MinIO to build high performance infrastructure for machine learning, analytics and application data workloads.

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

**Dostarczona wersja:** 2025.02.18~ynh1

## Zrzuty ekranu

![Zrzut ekranu z MinIO](./doc/screenshots/minio-browser.png)

## Dokumentacja i zasoby

- Oficjalna strona aplikacji: <https://min.io>
- Oficjalna dokumentacja dla administratora: <https://docs.min.io/>
- Repozytorium z kodem źródłowym: <https://github.com/minio/minio>
- Sklep YunoHost: <https://apps.yunohost.org/app/minio>
- Zgłaszanie błędów: <https://github.com/YunoHost-Apps/minio_ynh/issues>

## Informacje od twórców

Wyślij swój pull request do [gałęzi `testing`](https://github.com/YunoHost-Apps/minio_ynh/tree/testing).

Aby wypróbować gałąź `testing` postępuj zgodnie z instrukcjami:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
lub
sudo yunohost app upgrade minio -u https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
```

**Więcej informacji o tworzeniu paczek aplikacji:** <https://yunohost.org/packaging_apps>
