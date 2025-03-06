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
        action = "accept"
        port   = 443
    }

    inbound_rule {
        action = "accept"
        port   = 6333
    }

    inbound_rule {
        action = "accept"
        port   = 9998
    }
}