resource "scaleway_container_namespace" "webui_ns" {
    name        = "arte-open-webui"
    description = "Namespace for Open WebUI"
    region      = "fr-par"
}

resource "scaleway_container" "webui_ns" {
    name             = "arte-open-webui-terraform"
    description      = "terraform ARTE"
    namespace_id     = scaleway_container_namespace.webui_ns.id
    registry_image   = "ghcr.io/open-webui/open-webui:main"
    min_scale        = 1
    max_scale        = 5
    memory_limit     = 4096 # Ajuste selon tes besoins
    cpu_limit        = 3000     # Ajuste selon tes besoins
    privacy          = "public"
    port             = 8080
    protocol         = "http1"
    timeout         = 300
    deploy = true

    environment_variables = {
        "ENV" = "prod"
        "ENABLE_OLLAMA_API"= "false"
        "VECTOR_DB" = "qdrant"
        "QDRANT_URI" = "http://${scaleway_instance_ip.public_ip.address}:6333/"

        ##### MANAGED INFERENCE LLM ####
        "ENABLE_OPENAI_API" = "true"
        "DEFAULT_MODELS" = "${scaleway_inference_deployment.llm.model_name}"
        "OPENAI_API_BASE_URL" = "${scaleway_inference_deployment.llm.public_endpoint[0].url}/v1"
        ##### MANAGED INFERENCE EMBEDDING ####
        "RAG_EMBEDDING_ENGINE" = "openai"
        "RAG_EMBEDDING_MODEL" = "${scaleway_inference_deployment.embedding.model_name}"
        "RAG_OPENAI_API_BASE_URL" = "${scaleway_inference_deployment.embedding.public_endpoint[0].url}/v1"
        
        ##### RAG Deployment Options ####
        "ENABLE_RAG_WEB_SEARCH" = "true"
        "ENABLE_RAG_LOCAL_WEB_FETCH" = "true"
        "ENABLE_RAG_WEB_LOADER_SSL_VERIFICATION" ="true"
        "RAG_WEB_SEARCH_ENGINE" = "duckduckgo"
        "CHUNK_SIZE" = "1500"
        "PDF_EXTRACT_IMAGES" = "true"
        "RAG_TOP_K" = "4"
        "OFFLINE_MODE"= "false"

        ##### OCR Extract Options ####
        "CONTENT_EXTRACTION_ENGINE" = "tika"
        "TIKA_SERVER_URL"= "http://${scaleway_instance_ip.public_ip.address}:9998/"

        ##### Login Options ####
        "WEBUI_NAME" = "ARTE ChatBot Application"
        "ENABLE_SIGNUP" = "true"
        "ENABLE_LOGIN_FORM" = "true"
        "USER_PERMISSIONS_WORKSPACE_MODELS_ACCESS" = "true"
        "USER_PERMISSIONS_WORKSPACE_KNOWLEDGE_ACCESS" = "true"

        ##### Storage Options ####
        "STORAGE_PROVIDER" = "s3"
        "S3_ACCESS_KEY_ID" = var.access_key
        "S3_BUCKET_NAME"= "${scaleway_object_bucket.arte-webui-folder.name}"
        "S3_ENDPOINT_URL"= var.s3_endpoint_url
        "S3_REGION_NAME"= var.region
    }

    secret_environment_variables = {
        "OPENAI_API_KEY" = var.secret_key
        "QDRANT_API_KEY" = var.qdrant_api_key
        "RAG_OPENAI_API_KEY" = var.secret_key
        "S3_SECRET_ACCESS_KEY" = var.secret_key
    }
}
