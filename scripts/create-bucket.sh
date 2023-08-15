BUCKET_NAME=treinamento-aws-vinicius-dev

aws \
    s3 mb s3://$BUCKET_NAME \
    --endpoint http://localhost:4566

aws \
    s3 ls \
    --endpoint http://localhost:4566