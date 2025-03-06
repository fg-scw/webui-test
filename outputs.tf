output "scaleway_container_webui_ns" {
    value = "http://${scaleway_container.webui_ns.domain_name}"
    description = "L'adresse IP publique du Load Balancer"
}