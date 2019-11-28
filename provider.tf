provider "openstack" {
  user_name   = "alief"
  tenant_name = "alief"
  password    = "05011999Lab1"
  auth_url   = "http://lab1.nolsatu.id:5000"
  domain_name = "default"
}

provider "docker" {
  host = "tcp://10.37.37.20:2376/"
}

