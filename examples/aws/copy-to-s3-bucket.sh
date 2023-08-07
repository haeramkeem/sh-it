#!/bin/bash

aws s3 cp \
    --region $AWS_REGION \
    $SRC s3://$AWS_S3_BUCKET_NAME/$AWS_S3_BUCKET_PATH/$DST
