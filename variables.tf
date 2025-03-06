// Préférez utiliser la var. d’env. SCW_ACCESS_KEY
variable "access_key" {
  type = string
  description = "Notre identifiant de clé d'API"
}
// Preferez utiliser la var d'env SCW_SECRET_KEY
variable "secret_key" {
  type = string
  description = "Notre clé d'API"
}
// Préférez utiliser la var. d’env. SCW_DEFAULT_PROJECT_ID
// Pour trouver votre project_id rendez vous sur le dashboard de votre projet
variable "project_id" {
  type = string
  description = "Notre id de projet"
}
// Préférez utiliser la var. d’env. SCW_DEFAULT_PROJECT_ID.
// Pour trouver votre organization_id rendez-vous sur le dashboard de votre organisation
variable "organization_id" {
  type = string
  description = "Notre id d'organisation"
}

variable "region" {
  type = string
  description = "Region préférée"
}

variable "zone" {
  type = string
  description = "Region préférée"
}

# Variables pour la configuration
variable "qdrant_api_key" {
  description = "Clé API pour Qdrant"
  type        = string
  sensitive   = true
}

# Variables pour la configuration
variable "s3_endpoint_url" {
  description = "Custom Endpoint S3 Scaleway"
  type        = string
}