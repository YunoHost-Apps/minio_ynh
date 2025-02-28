<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# MinIO untuk YunoHost

[![Tingkat integrasi](https://apps.yunohost.org/badge/integration/minio)](https://ci-apps.yunohost.org/ci/apps/minio/)
![Status kerja](https://apps.yunohost.org/badge/state/minio)
![Status pemeliharaan](https://apps.yunohost.org/badge/maintained/minio)

[![Pasang MinIO dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=minio)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang MinIO secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

MinIO is a High Performance Object Storage. It is API compatible with Amazon S3 cloud storage service. Use MinIO to build high performance infrastructure for machine learning, analytics and application data workloads.


**Versi terkirim:** 2025.02.18~ynh2

## Tangkapan Layar

![Tangkapan Layar pada MinIO](./doc/screenshots/screenshot.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://min.io>
- Dokumentasi admin resmi: <https://docs.min.io/>
- Depot kode aplikasi hulu: <https://github.com/minio/minio>
- Gudang YunoHost: <https://apps.yunohost.org/app/minio>
- Laporkan bug: <https://github.com/YunoHost-Apps/minio_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/minio_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
atau
sudo yunohost app upgrade minio -u https://github.com/YunoHost-Apps/minio_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
