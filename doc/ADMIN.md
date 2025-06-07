## How to create a YunoHost app using MinIO

During the install process, MinIO will install both the MinIO server and MinIO client.
If your app needs to use an Amazon S3 storage, you are invited to use the MinIO client to create and setup buckets as per your app's requirements.

### First step: define MinIO user credentials

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

### Second step: create and setup your bucket

Below we assume we simply create a bucket and a user with the name of the app.
```bash
#=================================================
# SETUP MINIO BUCKET
#=================================================
ynh_script_progression --message="Setting up MinIO bucket..." --weight=1

sudo -u minio "$minio_install_dir/setup_app_bucket.sh" --app="$app" --secret="$minio_secret_key" \
  --with-versioning --region=YOUR_REGION # --with-versioning and --region are optional
```

Where:
 - `--with-versioning` enables the [bucket versioning](https://min.io/docs/minio/linux/administration/object-management/object-versioning.html) (your app may need it)
 - `--region=YOUR_REGION` defines a region where to create your bucket


### Third step: Setup your app configuration to use the bucket

When you setup your app's configuration, pass the following:
 - for the endpoint url: `https://__MINIO_DOMAIN__`
   - or alternatively `http://localhost:__MINIO_PORT__` where `__MINIO_PORT__` is retrieved using `ynh_app_setting_get --app="minio" --key="port"`;
 - for the bucket: `__MINIO_BUCKET__`;
 - for either the access key or the user: `__MINIO_ACCESS_KEY__`;
 - for either the secret key or the password: `__MINIO_SECRET_KEY__`;

### Limitations

#### Regarding the endpoint URL

That's a tricky part:
 - When using the `__MINIO_DOMAIN__`, the user can't change the URL of their MinIO server. Or they should regenerate your app's configuration (for example by forcing an upgrade).
 - When using the `__MINIO_PORT__`, the app should not check the certificate nor should it request fetch assets stored in the MinIO server directly from the client.

#### Backuping / restoring the app

You may backup and restore the app, keep in mind that the backup is not
self-sufficient. The user should restore first the MinIO app and then the app itself.

As an app packager, you should raise an error if MinIO is missing during the restoration.
