#!/bin/bash

aws deploy create-deployment \
    --application-name $AWS_CODEDEPLOY_APP_NAME \
    --deployment-group-name $AWS_CODEDEPLOY_DEPLOY_GROUP_NAME \
    --file-exists-behavior OVERWRITE \
    --deployment-config-name CodeDeployDefault.OneAtATime \
    --s3-location bucket=$AWS_S3_BUCKET_NAME,bundleType=tgz,key=$AWS_S3_BUCKET_PATH/$DEPLOY_TGZIP_FILE_NAME \
    --no-paginate
