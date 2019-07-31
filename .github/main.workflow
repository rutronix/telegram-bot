workflow "Main" {
  resolves = ["GitHub Action for Docker"]
  on = "push"
}

action "Docker Registry" {
  uses = "actions/docker/login@86ff551d26008267bb89ac11198ba7f1d807b699"
  secrets = ["DOCKER_REGISTRY_URL", "DOCKER_USER", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  needs = ["Docker Registry"]
  args = "build -t user/repo ."
}
