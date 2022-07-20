FROM litestream/litestream as bin

FROM directus/directus
COPY --from=bin /usr/local/bin/litestream /usr/local/bin/litestream

ENV KEY foobar
ENV SECRET barbaz

COPY litestream.docker.yml /etc/litestream.yml
COPY scripts/run.sh /scripts/run.sh

ENV STORAGE_LOCATIONS "s3"
ENV STORAGE_S3_DRIVER "s3"

ARG s3_key
ARG s3_secret
ARG s3_region
ARG s3_bucket

ENV STORAGE_S3_KEY=$s3_key
ENV STORAGE_S3_SECRET=$s3_secret
ENV STORAGE_S3_REGION=$s3_region
ENV STORAGE_S3_BUCKET=$s3_bucket

ENV ADMIN_EMAIL admin@me.com
ENV ADMIN_PASSWORD admin
ENV DB_CLIENT sqlite3
ENV DB_FILENAME /directus/database/data.db

EXPOSE 8055/tcp

CMD ["/scripts/run.sh"]
