variable "public_key" {
  type = string
  # Warning 此处一定要换成你自己的public key，不然你就会生成一个我能登录的虚拟机！
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCNVLjRA1KxCYw23ZCALfLwrPq8f8AAFge0j1Uxxq4NzRtfReMJoolIV5ypOOtVWi046hWMDC4OQMidmWAVqf2RzLBWpnONqMKjAE5ktk5zRsOXx2T+QIMfnEKRIHtDApmmqAa2T4ujVVySY1qDcMWR61Hkr/DfH4lrIT9fX/WzgkAuIGCPeNPUro7lse1v+hLGWswNAmwQg+Son7RswpA5+YkcZA3/rUyXxofV68/GsFCkxgn7gFoBn5jd6s2QHhy16cp5Ki1HV/2Dr8nucbeSDm94ckj4fqnZwaTY2o2xS8NF84utFGofiMpnzELEpNpPOJKbWe5FPMQD6EYt2SZf"
}

variable "image_id" {
  type = string
  # default to Amazon Linux 2
  default = "ami-0c2b8ca1dad447f8a"
}
