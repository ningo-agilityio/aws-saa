# 1 - CREATE TABLE
# aws dynamodb create-table \
#   --table-name StarBuck \
#   --attribute-definitions '[
#     {
#       "AttributeName": "StoreNumber",
#       "AttributeType": "S"
#     }
#   ]' \
#   --key-schema '[
#     {
#       "AttributeName": "StoreNumber",
#       "KeyType": "HASH"
#     }
#   ]' \
#   --provisioned-throughput '{
#     "ReadCapacityUnits": 1,
#     "WriteCapacityUnits": 1
#   }' \

# aws dynamodb update-table \
#   --table-name StarBuck \
#   --attribute-definitions '[
#     {
#       "AttributeName": "Country",
#       "AttributeType": "S"
#     },
#     {
#       "AttributeName": "StateCityPostcode",
#       "AttributeType": "S"
#     }
#   ]' \
#   --global-secondary-index-updates '[
#     {
#       "Create": {
#         "IndexName": "StoreLocationIndex",
#         "KeySchema": [
#           {
#             "AttributeName": "Country",
#             "KeyType": "HASH"
#           },
#           {
#             "AttributeName": "StateCityPostcode",
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
aws dynamodb batch-write-item \
  --request-items '{
    "StarBuck": [
      {
        "PutRequest": {
          "Item": {
            "StoreNumber": {"S": "S001"},
            "Country": {"S": "VN"},
            "StateCityPostcode": {"S": "55000"}
          }
        }
      },
      {
        "PutRequest": {
          "Item": {
            "StoreNumber": {"S": "S098"},
            "Country": {"S": "US"},
            "StateCityPostcode": {"S": "03567"}
          }
        }
      },
      {
        "PutRequest": {
          "Item": {
            "StoreNumber": {"S": "S110"},
            "Country": {"S": "FR"},
            "StateCityPostcode": {"S": "23456"}
          }
        }
      },
      {
        "PutRequest": {
          "Item": {
            "StoreNumber": {"S": "S980"},
            "Country": {"S": "EN"},
            "StateCityPostcode": {"S": "12503"}
          }
        }
      }
    ]
  }' \

aws dynamodb scan \
    --table-name StarBuck \
    --index-name StoreLocationIndex \
