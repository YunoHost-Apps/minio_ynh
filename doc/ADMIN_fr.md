## Comment créer une application YunoHost avec MinIO

Pendant le processus d'installation, MinIO installe à la fois le serveur MinIO et le client MinIO.
Si votre application nécessite l'utilisation d'un espace de stockage (*bucket*) Amazon S3, vous êtes invité à utiliser le client MinIO pour créer et configurer un bucket selon les besoins de votre application.

### Première étape : Définir les accès à MinIO

```bash
#=================================================
# SETUP MINIO CREDENTIALS
#=================================================
minio_domain=$(ynh_app_setting_get --app="minio" --key=domain)
minio_secret_key=$(ynh_string_random -l 32)
minio_install_dir=$(ynh_app_setting_get --app="minio" --key=install_dir)
minio_access_key=$app
minio_bucket=$app

ynh_app_setting_set --key=minio_access_key --value=$minio_access_key
ynh_app_setting_set --key=minio_bucket --value=$minio_bucket
ynh_app_setting_set --key=minio_secret_key --value=$minio_secret_key
```

### Deuxième étape : créer et configurer votre bucket

En supposant simplement que nous créons un bucket et une clé d'accès portant le nom de l'app.
```bash
#=================================================
# SETUP MINIO BUCKET
#=================================================
ynh_script_progression --message="Setting up MinIO bucket..." --weight=1

sudo -u minio "$minio_install_dir/setup_app_bucket.sh" --app="$app" --secret="$minio_secret_key" \
  --with-versioning # --with-versioning étant optionnel
```

Où:
 - `--with-versioning` active le [versionnage du bucket](https://min.io/docs/minio/linux/administration/object-management/object-versioning.html) (votre application pourrait en avoir besoin)

### Troisième étape : Configurer votre application pour utiliser le bucket

Lorsque vous définissez la configuration de votre application, passez les éléments suivants :
 - pour l'URL du point d'accès (*endpoint* en anglais) : `https://__MINIO_DOMAIN__`
   - ou sinon `http://localhost:__MINIO_PORT__` où `__MINIO_PORT__` est récupéré en utilisant `ynh_app_setting_get --app="minio" --key="port"` ;
 - pour le nom du bucket : `__MINIO_BUCKET__`;
 - pour l'identifiant d'accès (*access key*) ou l'utilisateur : `__MINIO_ACCESS_KEY__`;
 - pour le mot de passe ou la clé secrète (*secret key*) : `__MINIO_SECRET_KEY__`;

### Limites

#### En ce qui concerne l'URL du point d'accès

C'est une partie délicate :
 - Lorsque vous utilisez `__MINIO_DOMAIN__`, l'utilisateur/rice ne peut pas modifier l'URL de son serveur Minio. Ou il/elle doit régénérer la configuration de son application (par exemple en forçant une mise à jour).
 - Lorsque vous utilisez `__MINIO_PORT__`, l'application ne doit pas vérifier le certificat ni demander à télécharger les assets stockés dans le serveur Minio directement depuis le client.

#### Sauvegarde / restauration de l'application

Vous pouvez sauvegarder et restaurer l'application, gardez à l'esprit que la sauvegarde n'est pas auto-suffisante. L'utilisateur/rice doit d'abord restaurer l'application Minio et ensuite l'application elle-même.

En tant que packageur d'applications, vous devriez faire en sorte que MinIO soit présent pendant la restauration.
