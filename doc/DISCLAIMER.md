* Known limitations
    * Requires a full dedicated domain (two if you need the console)
    * If you install through the web admin, you can't skip installing the console
    * No LDAP integration
    * No multi-instance (you should use several buckets instead)

* Other infos that people should be aware of, such as:
    * To log in the console, credentials are stored in /var/www/minio/.env
    * To interact with minio using the client from another app install script, you can have a look at outline_ynh app
