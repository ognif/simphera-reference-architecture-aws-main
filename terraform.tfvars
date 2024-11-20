
# The AWS account where resource are created
account_id = "561405374610"
infrastructurename = "simphera-reference"

# The AWS region to be used
region = "eu-central-1"

# The tags to be added to all resources
tags = {}

# The machine size of the Linux nodes for the regular services
linuxNodeSize = ["m5a.2xlarge"]

# The minimum number of Linux nodes for the regular services
linuxNodeCountMin = 1

# The maximum number of Linux nodes for the regular services
linuxNodeCountMax = 4

# The machine size of the Linux nodes for the job execution
linuxExecutionNodeSize = ["m5a.2xlarge"]

# The minimum number of Linux nodes for the job execution
linuxExecutionNodeCountMin = 1

# The maximum number of Linux nodes for the job execution
linuxExecutionNodeCountMax = 4

# Specifies whether a VM for the dSPACE Installation Manager will be deployed
licenseServer = false

# The version of the EKS cluster.
kubernetesVersion = "1.27"

# The CIDR for the virtual private cluster.
vpcCidr = "10.1.0.0/18"

# List of CIDRs for the private subnets.
vpcPrivateSubnets = ["10.1.0.0/22", "10.1.4.0/22", "10.1.8.0/22"]

# List of CIDRs for the public subnets.
vpcPublicSubnets = ["10.1.12.0/22", "10.1.16.0/22", "10.1.20.0/22"]

# List of CIDRs for the database subnets.
vpcDatabaseSubnets = ["10.1.24.0/22", "10.1.28.0/22", "10.1.32.0/22"]

enable_ingress_nginx = true

# Install FluentBit to send container logs to CloudWatch.
enable_aws_for_fluentbit = false

simpheraInstances = {
  "production" = {
    name                         = "production"
    postgresqlVersion            = "11"
    postgresqlStorage            = 20
    postgresqlMaxStorage         = 100
    postgresqlStorageKeycloak    = 20
    postgresqlMaxStorageKeycloak = 100
    db_instance_type_keycloak    = "db.t3.large"
    db_instance_type_simphera    = "db.t3.large"
    k8s_namespace                = "simphera"
    secretname                   = "aws-simphera-dev-production"
    enable_backup_service        = true
    backup_retention             = 35   
    enable_deletion_protection   = true 
  }
}
