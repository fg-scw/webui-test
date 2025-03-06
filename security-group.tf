# resource "scaleway_instance_security_group" "arte-db-qdrant" {
#   project_id              = var.project_id
#   name                    = "no-public-access"
#   inbound_default_policy  = "true"
#   outbound_default_policy = "drop"
#   stateful                = true
# }

# inbound_rule {
#     action   = "accept"
#     port     = "22"
#     ip_range = "${scaleway_vpc_public_gateway_ip.gwip01.address}/32"
# }

resource "scaleway_instance_security_group" "arte-db-qdrant" {
    name                    = "no-public-access"
}

resource "scaleway_instance_security_group" "web" {
    inbound_default_policy = "drop" # By default we drop incoming traffic that do not match any inbound_rule

    inbound_rule {
        action = "accept"
        port   = 22
        ip_range = "0.0.0.0/0"
    }

    inbound_rule {
        action = "accept"
        port   = 80
    }

    inbound_rule {
        action     = "accept"
        protocol   = "UDP"
        port_range = "22-23"
    }
}