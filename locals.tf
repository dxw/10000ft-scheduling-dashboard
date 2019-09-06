locals {
  app_name = "10kft-scheduling"

  app_github_owner = "dxw"
  app_github_repo  = "10000ft-scheduling-dashboard"
  app_service_name = "${local.app_name}-${var.environment}"

  app_container_entrypoint = ["./docker-entrypoint.sh"]
  app_container_command    = ["bundle", "exec", "puma", "-p", "5000"]
}
