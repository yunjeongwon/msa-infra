#!/bin/bash

echo "---------- 서버 배포 시작 ----------"
cd /home/ubuntu/app
DB_HOST=$(aws ssm get-parameter \
  --name "/prod/app/DB_HOST" \
  --query Parameter.Value \
  --output text)
MYSQL_ROOT_PASSWORD=$(aws ssm get-parameter \
  --name "/prod/app/MYSQL_ROOT_PASSWORD" \
  --with-decryption \
  --query Parameter.Value \
  --output text)
JWT_SECRET=$(aws ssm get-parameter \
  --name "/prod/app/JWT_SECRET" \
  --with-decryption \
  --query Parameter.Value \
  --output text)

cat <<EOF > .env
DB_HOST=${DB_HOST}
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
JWT_SECRET=${JWT_SECRET}
SPRING_PROFILES_ACTIVE=prod
EOF

docker compose pull
docker compose up -d
echo "---------- 서버 배포 끝 ----------"
