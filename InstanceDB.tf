# Lecture du fichier cloud-init
data "template_file" "cloud_init" {
  template = file("${path.module}/cloud-init.yaml")
  
  vars = {
    QDRANT_API_KEY = var.qdrant_api_key
  }
}

resource "scaleway_block_volume" "data" {
    name  = "data-sbs"
    iops = 15000
    size_in_gb = 45
}

resource "scaleway_instance_ip" "public_ip" {
}

resource "scaleway_instance_server" "instance" {
  project_id        = var.project_id
  name              = "Qdrant-New"
  type              = "POP2-HN-3"
  image             = "ubuntu_jammy"
  tags              = [ "qdrant", "public" ]
  security_group_id = scaleway_instance_security_group.arte-db-qdrant.id
  ip_id = scaleway_instance_ip.public_ip.id

  root_volume {
    volume_type = "sbs_volume"
    sbs_iops    = 15000
    size_in_gb  = 30
  }
  additional_volume_ids = [scaleway_block_volume.data.id ]

  user_data = {
    cloud-init = data.template_file.cloud_init.rendered
  }
}