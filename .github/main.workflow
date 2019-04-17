workflow "mavenclean" {
  on = "push"
  resolves = ["GitHub Action for Maven"]
}

action "GitHub Action for Maven" {
  uses = "LucaFeger/action-maven-cli@1.1.0"
}
