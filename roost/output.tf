output "controlplane_id" {
  value = aws_instance.roost_controlplane.id
}
output "server_id"{
  value=aws_instance.roost_eaas_server.id
}
output "jumphost_id" {
  value = aws_instance.roost_jumphost.id
}
output "ssh_id"{
  value = aws_instance.roost_ssh.id
}
output "ssh_public_ip"{
  value = aws_instance.roost_ssh.public_ip
}
output "eaas_endpoint"{
  value = var.enterprise_dns
}
output "hostedzone_id"{
  value = data.aws_route53_zone.eaas.zone_id
}