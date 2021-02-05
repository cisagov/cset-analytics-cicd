#=================================================
#  CORE
#=================================================
env = "dev"
app = "cset-analytics"
region = "us-east-1"

#=================================================
#  NETWORK
#=================================================
private_subnet_ids = [
    "subnet-0153f175feb0dfce5",
    "subnet-02f0f6199dd75238b"
]

public_subnet_ids = [
    "subnet-0a365c16b67a2b6b0",
    "subnet-0ea8f699bed93417c"
]

vpc_id = "vpc-074f7db64238a2d16"

#=================================================
#  PERMISSIONS
#=================================================
allowed_actions = ["s3:*", "cognito:*", "cognito-identity:*", "cognito-idp:*", "cognito-sync:*"]

#=================================================
#  LOGS
#=================================================
log_retention_days = 7

#=================================================
#  LOAD BALANCING
#=================================================
idle_timeout = 600

#=================================================
#  ROUTE 53
#=================================================
route53_zone_name = "inltesting.xyz"

#=================================================
#  DOCUMENTDB
#=================================================
documentdb_cluster_size = 1
documentdb_instance_class = "db.r5.large"

#=================================================
#  API
#=================================================
api_image_repo = "780016325729.dkr.ecr.us-east-1.amazonaws.com/cset-analytics-api"
api_cpu = 2048
api_memory = 4096
api_desired_count = 1

#=================================================
#  UI
#=================================================
ui_image_repo = "780016325729.dkr.ecr.us-east-1.amazonaws.com/cset-analytics-ui"
ui_cpu = 2048
ui_memory = 4096
ui_desired_count = 1
