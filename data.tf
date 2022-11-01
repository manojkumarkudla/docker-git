data "aws_vpc" "talent_academy" {
  filter {
    name   = "tag:Name"
    values = ["docker-vpc"]
  }

}

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["public"]
   }

}