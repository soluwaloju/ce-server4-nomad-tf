module "nomad_clients" {
  
source = "git::https://github.com/CircleCI-Public/server-terraform.git//nomad-aws?ref=4.0.0"

  # Number of nomad clients to run
  nodes = 1
  subnet = "subnet-41da6828"  
  vpc_id = "vpc-9447e4fd"
  basename = "seun-namer-east"
  instance_type = "m5.2xlarge" 
  instance_tags = {
    "vendor" = "circleci"
    "team"   = "custeng"
    "owner" = "seun"
  }
  
  enable_mtls=true

  server_endpoint = "seun-namer-east.eks-dev.sphereci.com:4647"

  dns_server = ""
  blocked_cidrs = [
    ""
  ]
}

output "nomad_server_cert" {
value = base64encode(module.nomad_clients.nomad_server_cert)
}

output "nomad_server_key" {
value = base64encode(module.nomad_clients.nomad_server_key)
}

output "nomad_ca" {
value = base64encode(module.nomad_clients.nomad_tls_ca)
}
  
 output "nomad" {
  value     = module.nomad_clients
}
