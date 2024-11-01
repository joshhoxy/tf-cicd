# Input locals
############################
## subneting of VPC
locals {
  public_subnets_vpc_a = [
    {
      purpose = "sub-pub"
      zone    = "${var.region}a" ## Must be put a AZs alphabet
      cidr    = "10.0.0.0/24"
    },
    {
      purpose = "sub-pub"
      zone    = "${var.region}c" ## Must be put a AZs alphabet
      cidr    = "10.0.1.0/24"
    }
  ]
}
locals {
  zone_index = { ### 사용하는 모든 public subnet의 ㄴzone을 명시 (var.single_nat = false 일 때 private_subnet 갯수와 association에 연관됨)
    "a" = 0,
    "c" = 1
  }
  nat_gateway_count = 0
}
locals {
  my_ip_addrs = join("", [local.ifconfig_co_json.ip, "/32"])
}

data "http" "my_auto_ip_addr" {
  url = try("https://ifconfig.co/json", "")
  request_headers = {
    Accept = "application/json"
  }
}
locals {
  ifconfig_co_json = jsondecode(data.http.my_auto_ip_addr.body)
}