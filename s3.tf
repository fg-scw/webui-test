resource "scaleway_object_bucket" "arte-webui-folder" {
    name = "arte-webui-folder"
    region = var.region
    force_destroy = true
    tags = {
        key = "webui-bucket"
    }
}