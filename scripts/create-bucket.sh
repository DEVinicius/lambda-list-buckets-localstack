BUCKET_NAME=local-data-files

aws \
    s3 mb s3://$BUCKET_NAME \
    --endpoint http://localhost:4566

aws \
    s3 ls \
    --endpoint http://localhost:4566

aws \
    s3 ls s3://$BUCKET_NAME\
    --endpoint http://localhost:4566

aws \
    s3 cp teste.txt s3://$BUCKET_NAME\
    --endpoint http://localhost:4566

aws s3 put-object \
  --bucket $BUCKET_NAME \
  --key teste.txt \
  --body teste.txt \
  --endpoint http://localhost:4566
