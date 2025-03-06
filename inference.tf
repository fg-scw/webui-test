resource "scaleway_inference_deployment" "llm" {
    name = "arte-inference-deployment"
    node_type = "H100"
    model_name = "meta/llama-3.3-70b-instruct:fp8"
    public_endpoint {
        is_enabled = true
    }
    accept_eula = true
}

resource "scaleway_inference_deployment" "embedding" {
    name = "arte-embedding-deployment"
    node_type = "L4"
    model_name = "baai/bge-multilingual-gemma2:fp32"
    public_endpoint {
        is_enabled = true
    }
    accept_eula = true
}