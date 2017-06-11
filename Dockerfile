FROM alpine:latest

LABEL maintainer "tomelliff@gmail.com"

ENV TERRAFORM_VERSION=0.9.8
ENV TERRAFORM_SHA256SUM=f951885f4e15deb4cf66f3b199964e3e74a0298bb46c9fe42e105df2ebcf3d16

RUN apk add --update git curl openssh make python py-pip && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    pip install awscli
