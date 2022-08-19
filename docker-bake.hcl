# docker-bake.hcl

variable "TAG" {
  default = "latest"
}

group "default" {
  targets = ["husbzb-firmware"]
}

target "husbzb-firmware" {
  tags = [
    "ghcr.io/kageurufu/husbzb-firmware:${TAG}"
  ]
  args = {

  }
  dockerfile = "Dockerfile"
  platforms = [
    "linux/amd64",
    "linux/arm/v5",
    "linux/arm/v7",
    "linux/arm64/v8",
    "linux/386",
    // "linux/mips64le",
    // "linux/ppc64le",
    // "linux/s390x",
    // "windows/amd64",
    // "windows/amd64",
  ]
}
