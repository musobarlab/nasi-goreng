FROM golang:1.12.5-alpine3.9

# Add args
ARG PERSONAL_ACCESS_TOKEN
ARG APP_NAME=nasi-goreng
ARG LOG_DIR=/${APP_NAME}/logs

# env build packages
ARG BUILD_PACKAGES="git curl"
# build packages with cert
# ARG BUILD_PACKAGES="git curl ca-certificates"

# Create folder logs
RUN mkdir -p ${LOG_DIR}

# Set the Current Working Directory inside the container
WORKDIR /usr/app

# Add the source code
ENV SRC_DIR=/usr/app/

# Environment Variables
ENV LOG_FILE_LOCATION=${LOG_DIR}/app.log

COPY . $SRC_DIR

RUN apk update && apk add --no-cache $BUILD_PACKAGES

RUN chmod +x ./scripts/github_private_repo.sh

RUN ./scripts/github_private_repo.sh $PERSONAL_ACCESS_TOKEN

RUN go mod download \
  && CGO_ENABLED=0 GOOS=linux go build -ldflags '-w -s' -a -o app . \
  && apk del $BUILD_PACKAGES

# Copy environment variable to source dir
#COPY .env $SRC_DIR.env

#EXPOSE 8080
#EXPOSE 8081

ENTRYPOINT ["sh", "-c", "./app"]
