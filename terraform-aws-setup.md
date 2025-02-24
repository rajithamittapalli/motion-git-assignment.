provider "aws" {
  region = "us-east-1"  # Change this to your preferred AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformEC2"
  }
}
