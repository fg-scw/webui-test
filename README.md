  # ChatBot LLM & RAG on Scaleway Cloud

  # What products you need to make it works :
  - 1* SCW API KEY & SECRET KEY with permissions on products below
  - 1-5* Serverless Container
  - 1* Instances CPU Hosting Container docker ( Qdrant + Tika )
  - 1* Bucket S3
  - (Option) 1* DB PostgreSQL Managed by Scaleway wit pgvector
  - 1* Managed Inference Embedding "baaie/bge-multilingual-gemma2:fp32"
  - 1* Managed Inference LLM "meta/llama-3.3-70b-instruct:fp8"

![alt text]([http://url/to](https://github.com/fg-scw/webui-test/images/architecture.png?raw=true))

   # How to use it :
  - Clone the repo
  - Modify the file "terraforms.tfvars" with your credentials 

   # Modify terraforms.tfvars file
    access_key = "ENTER VOTRE ACCESS KEY"
    secret_key = "ENTER VOTRE SECRET KEY"
    project_id = "ENTRER VOTRE PROJECT ID"
    organization_id = "ENTRER VOTRE ORGANIZATION ID"
    region = "fr-par"
    zone = "fr-par-2"
    qdrant_api_key = "Y3NMMGK3Okzt7rzho88jhmzPZl5MhmAtwFbLG4OJPGRtNV7pH8sOlVNtveGcejEl"  ### Clé Arbitraire (Si Modification, pensez à remplacer la valeur dans le cloud-init.yaml)
    s3_endpoint_url = "https://s3.fr-par.scw.cloud"
       

   # Launch the Application 
  - terraform init
  - terraform plan
  - terraform apply --auto-approve

   # First Login
  - Create an Admin with fake email/info if you want (It's a local admin)

![alt text]([http://url/to](https://github.com/fg-scw/webui-test/images/login.png?raw=true))
