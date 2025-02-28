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