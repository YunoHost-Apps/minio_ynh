#!/bin/bash

set -eEu -o pipefail

if [ "$(whoami)" != "minio" ]; then
  sudo -u minio "$0" "$@"
  exit $?
fi

mb_opts=()
help=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --app=*) APP="${1#*=}"; shift 1;;
    --secret=*) SECRET="${1#*=}"; shift 1;;
    --with-versioning) mb_opts+=("--with-versioning"); shift 1;;
    --help*) help=1; shift 1;;

    *) echo "unknown option: $1" >&2; exit 1;;
  esac
done

if [ "$help" == "1" ]; then
  echo "Usage: $0 --app=\$app --secret=YOUR_SECRET [--with-versioning]"
  echo ""
  echo "Set up a MinIO bucket for apps. Meant to be used by packages."
  echo "Also creates a user in MinIO who will be granted readwrite access only to this bucket."
  echo "See the admin documentation for more info: https://github.com/YunoHost-Apps/minio_ynh/blob/master/doc/ADMIN.md"
  exit 0
fi

if [ -z "${APP:-}" ]; then
  echo "Please pass the following mandatory argument: --app=\$app" >&2
  exit 1
fi

if [ -z "${SECRET:-}" ]; then
  echo 'Please pass the following mandatory argument: --secret="YOUR_SECRET"' >&2
  exit 1
fi

USER=$APP
BUCKET=$APP

policy_file=$(mktemp --suffix=".$APP.policy.json")
minio_install_dir=$(dirname -- "$0")

cleanup() {
  rv=$?
  rm -f "$policy_file"
  exit $rv
}

trap "cleanup" EXIT

if "$minio_install_dir/mc" ls --json minio | jq -r ".key" | grep -q "^$APP/$"; then
  echo "Bucket already exist, skip"
  exit 0
fi

# Create a user in S3 for the app
"$minio_install_dir/mc" admin user add minio "$USER" "$SECRET"

# Create a bucket in S3 for the app
"$minio_install_dir/mc" mb "${mb_opts[@]}" "minio/$BUCKET"

# Create a new policy to give only access to the app's bucket
# The policy_file is temporary and will be cleaned up at the end of the execution
# NB: the `mc admin policy create` command does not seem to accept the here-documents syntax, hence the temporary file
cat <<EOF > "$policy_file"
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": [ "s3:*" ],
    "Resource": [
      "arn:aws:s3:::$BUCKET/*",
      "arn:aws:s3:::$BUCKET"
    ]
  }]
}
EOF
"$minio_install_dir/mc" admin policy create minio "readwrite-$APP" "$policy_file"

# Attach the policy to the app's user on minio
"$minio_install_dir/mc" admin policy attach minio "readwrite-$APP" --user "$USER"
