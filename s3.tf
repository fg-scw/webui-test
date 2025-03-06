resource "scaleway_object_bucket" "arte-webui-folder" {
  name = "arte-webui-folder"
  region = var.region
  tags = {
    key = "webui-bucket"
  }
}