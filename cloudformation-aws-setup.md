AWSTemplateFormatVersion: '2010-09-09'
Resources:
  MyEC2Instance:
    Type: 'AWS::EC2::Instance'
    Properties:
      InstanceType: t2.micro  # Modify the instance type as needed
      ImageId: ami-0c55b159cbfafe1f0  # Replace with the desired AMI ID
      KeyName: MyKeyPair  # Replace with your key pair name
      SecurityGroups:
        - Ref: MySecurityGroup  # Reference to the security group created below
      Tags:
        - Key: Name
          Value: MyEC2Instance
  MySecurityGroup:
    Type: 'AWS::EC2::SecurityGroup'
    Properties:
      GroupDescription: "Allow SSH access"
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: '22'
          ToPort: '22'
          CidrIp: '0.0.0.0/0'  # Adjust the CIDR block as needed for security
Outputs:
  InstanceId:
    Description: "Instance ID"
    Value: !Ref MyEC2Instance
  PublicIP:
    Description: "Public IP Address of the EC2 instance"
    Value: !GetAtt MyEC2Instance.PublicIp
