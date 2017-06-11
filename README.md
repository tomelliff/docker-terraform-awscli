# Minimal Terraform and AWS CLI image

Builds a minimal image for deploying projects using [Terraform](https://www.terraform.io/) and the [AWS CLI](https://aws.amazon.com/cli/).

The main use is for deploying static websites into S3 buckets using [Gitlab CI](https://about.gitlab.com/features/gitlab-ci-cd/).

### Using the image

#### Pulling from [Docker Hub](https://hub.docker.com/r/tomelliff/terraform-awscli/)
```sh
docker pull tomelliff/terraform-awscli
```

#### Running the image locally
```sh
docker run -it tomelliff/terraform-awscli /bin/sh
```

#### Using it in Gitlab CI
```yaml
deploy:
  stage: deploy
  image: tomelliff/terraform-awscli:latest
  script:
    - make deploy
```
