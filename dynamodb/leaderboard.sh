# 1 - CREATE TABLE
# aws dynamodb create-table \
#   --table-name LeaderBoard \
#   --attribute-definitions '[
#     {
#       "AttributeName": "Image",
#       "AttributeType": "S"
#     },
#     {
#       "AttributeName": "ViewCount",
#       "AttributeType": "N"
#     }
#   ]' \
#   --key-schema '[
#     {
#       "AttributeName": "Image",
#       "KeyType": "HASH"
#     },
#     {
#       "AttributeName": "ViewCount",
#       "KeyType": "RANGE"
#     }
#   ]' \
#   --provisioned-throughput '{
#     "ReadCapacityUnits": 1,
#     "WriteCapacityUnits": 1
#   }' \

# aws dynamodb update-table \
#   --table-name LeaderBoard \
#   --attribute-definitions '[
#     {
#       "AttributeName": "Image",
#       "AttributeType": "S"
#     },
#     {
#       "AttributeName": "ViewCount",
#       "AttributeType": "N"
#     }
#   ]' \
#   --global-secondary-index-updates '[
#     {
#       "Create": {
#         "IndexName": "GSIImageOrderIndex",
#         "KeySchema": [
#           {
#             "AttributeName": "Image",
#             "KeyType": "HASH"
#           },
#           {
#             "AttributeName": "ViewCount",
#             "KeyType": "RANGE"
#           }
#         ],
#         "Projection": {
#           "ProjectionType": "ALL"
#         },
#         "ProvisionedThroughput": {
#           "ReadCapacityUnits": 1,
#           "WriteCapacityUnits": 1
#         }
#       }
#     }
#   ]' \

# 2 - WRITE DATA
# aws dynamodb batch-write-item \
#   --request-items '{
#     "LeaderBoard": [
#       {
#         "PutRequest": {
#           "Item": {
#             "Image": {"S": "images/test.jpg"},
#             "Partition": {"S": "PARTITION_0"},
#             "ViewCount": {"N": "90"}
#           }
#         }
#       },
#       {
#         "PutRequest": {
#           "Item": {
#             "Image": {"S": "images/test1.jpg"},
#             "Partition": {"S": "PARTITION_0"},
#             "ViewCount": {"N": "100"}
#           }
#         }
#       },
#       {
#         "PutRequest": {
#           "Item": {
#             "Image": {"S": "images/test2.jpg"},
#             "Partition": {"S": "PARTITION_1"},
#             "ViewCount": {"N": "81"}
#           }
#         }
#       },
#       {
#         "PutRequest": {
#           "Item": {
#             "Image": {"S": "images/test3.jpg"},
#             "Partition": {"S": "PARTITION_2"},
#             "ViewCount": {"N": "109"}
#           }
#         }
#       }
#     ]
#   }' \
# 3 - SCAN DATA
aws dynamodb scan \
    --table-name LeaderBoard \
    --index-name GSIImageOrderIndex \
