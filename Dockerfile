FROM alpine:latest

LABEL maintainer "tomelliff@gmail.com"

ENV TERRAFORM_VERSION=0.9.6
ENV TERRAFORM_SHA256SUM=7ec24a5d57da6ef7bdb5a3003791a4368489b32fa93be800655ccef0eceaf1ba

RUN apk add --update git curl openssh make python py-pip && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    pip install awscli
