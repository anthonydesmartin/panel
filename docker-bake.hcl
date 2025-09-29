group "default" {
  targets = ["base-php", "panel"]
}

target "base-php" {
  dockerfile = "Dockerfile.base"
  context    = "."
  tags       = ["pelican-panel-registry-cbo9ov/base-php:latest"]
  platforms  = ["linux/amd64", "linux/arm64"]
}

target "panel" {
  dockerfile = "Dockerfile"
  context    = "."
  tags       = ["pelican-panel-registry-cbo9ov/panel:latest"]
  platforms  = ["linux/amd64", "linux/arm64"]

  # Si tu veux t'assurer que base-php est buildé avant
  inherits = ["base-php"]
}
