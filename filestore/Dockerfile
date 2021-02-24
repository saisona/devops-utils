FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine

RUN apk add jq

WORKDIR /app
COPY tf-infrastructure-ml.json /app/key.json

RUN gcloud components update &&\
    gcloud components install beta &&\
    gcloud auth activate-service-account --key-file=/app/key.json &&\
    gcloud config set project tf-infrastructure-ml

COPY .sendSlackMessage.sh .
COPY filestore-backup .

CMD ["/app/filestore-backup"]
