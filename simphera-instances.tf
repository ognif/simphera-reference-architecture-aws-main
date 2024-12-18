module "simphera_instance" {
  source                       = "./modules/simphera_aws_instance"
  for_each                     = var.simpheraInstances
  region                       = var.region
  infrastructurename           = local.infrastructurename
  k8s_cluster_id               = module.eks.eks_cluster_id
  k8s_cluster_oidc_arn         = module.eks.eks_oidc_provider_arn
  tags                         = var.tags
  eks_oidc_issuer_url          = module.eks.eks_oidc_issuer_url
  eks_oidc_provider_arn        = module.eks.eks_oidc_provider_arn
  name                         = each.value.name
  postgresqlVersion            = each.value.postgresqlVersion
  postgresqlStorage            = each.value.postgresqlStorage
  postgresqlMaxStorage         = each.value.postgresqlMaxStorage
  postgresqlStorageKeycloak    = each.value.postgresqlStorageKeycloak
  postgresqlMaxStorageKeycloak = each.value.postgresqlMaxStorageKeycloak
  db_instance_type_keycloak    = each.value.db_instance_type_keycloak
  db_instance_type_simphera    = each.value.db_instance_type_simphera
  k8s_namespace                = each.value.k8s_namespace
  secretname                   = each.value.secretname
  enable_backup_service        = each.value.enable_backup_service
  backup_retention             = each.value.backup_retention
  cloudwatch_retention         = var.cloudwatch_retention
  enable_deletion_protection   = each.value.enable_deletion_protection
  public_subnets               = module.vpc.public_subnets
  vpc_id                       = module.vpc.vpc_id
  postgresql_security_group_id = module.security_group.security_group_id
  kms_key_cloudwatch           = aws_kms_key.kms_key_cloudwatch_log_group.arn
  log_bucket                   = aws_s3_bucket.bucket_logs.id
  database_subnet_group_name   = module.vpc.database_subnet_group_name
}
