### 1. prepare the litestream config file

```bash
cp litestream.docker.example.yml litestream.docker.yml
```

Now set your S3 access_key and secret inside "litestream.docker.yml".

### 2. Build the docker image:

```bash
export S3_KEY="<the key>"
export S3_SECRET="<the secret>"
export S3_REGION="ap-northeast-1"
export S3_BUCKET="<s3-bucket-name>"

$ docker build \
  --build-arg s3_key=${S3_KEY} \
  --build-arg s3_secret=${S3_SECRET} \
  --build-arg s3_region=${S3_REGION} \
  --build-arg s3_bucket=${S3_BUCKET} \
  -t litestream-directus:latest .
```

### 3. Run the image

```bash
$ docker run -p 8055:8055 litestream-directus:latest
```

Then visit http://localhost:8055 then initial login credentials are:

```
admin@me.com
admin
```
