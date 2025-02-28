<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# MinIO YunoHost-erako

[![Integrazio maila](https://apps.yunohost.org/badge/integration/minio)](https://ci-apps.yunohost.org/ci/apps/minio/)
![Funtzionamendu egoera](https://apps.yunohost.org/badge/state/minio)
![Mantentze egoera](https://apps.yunohost.org/badge/maintained/minio)

[![Instalatu MinIO YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=minio)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek MinIO YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

MinIO is a High Performance Object Storage. It is API compatible with Amazon S3 cloud storage service. Use MinIO to build high performance infrastructure for machine learning, analytics and application data workloads.


**Paketatutako bertsioa:** 2025.02.18~ynh1

## Pantaila-argazkiak

![MinIO(r)en pantaila-argazkia](./doc/screenshots/screenshot.png)

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
