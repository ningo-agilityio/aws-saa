# 1 - CREATE TABLE
# aws dynamodb create-table \
#   --table-name UserOrdersTable \
#   --attribute-definitions '[
#     {
#         "AttributeName": "Username",
#         "AttributeType": "S"
#     },
#     {
#         "AttributeName": "OrderId",
#         "AttributeType": "S"
#     }
#   ]' \
#   --key-schema '[
#     {
#         "AttributeName": "Username",
#         "KeyType": "HASH"
#     },
#     {
#         "AttributeName": "OrderId",
#         "KeyType": "RANGE"
#     }
#   ]' \
#   --provisioned-throughput '{
#     "ReadCapacityUnits": 1,
#     "WriteCapacityUnits": 1
#   }' \

# 2 - INSERT MULTI ITEMS by BATCH WRITE
# aws dynamodb batch-write-item \
#   --request-items '{
#       "UserOrdersTable": [
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20160630-12928"},
#                       "Amount": {"N": "142.23"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "daffyduck"},
#                       "OrderId": {"S": "20170608-10171"},
#                       "Amount": {"N": "18.95"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "daffyduck"},
#                       "OrderId": {"S": "20170609-25875"},
#                       "Amount": {"N": "116.86"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "daffyduck"},
#                       "OrderId": {"S": "20160630-28176"},
#                       "Amount": {"N": "88.30"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "yosemitesam"},
#                       "OrderId": {"S": "20170609-18618"},
#                       "Amount": {"N": "122.45"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170609-4177"},
#                       "Amount": {"N": "27.89"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170608-24041"},
#                       "Amount": {"N": "142.02"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "yosemitesam"},
#                       "OrderId": {"S": "20170609-17146"},
#                       "Amount": {"N": "114.00"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "yosemitesam"},
#                       "OrderId": {"S": "20170609-9476"},
#                       "Amount": {"N": "19.41"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20160630-13286"},
#                       "Amount": {"N": "146.37"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170609-8718"},
#                       "Amount": {"N": "76.19"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "daffyduck"},
#                       "OrderId": {"S": "20171129-29970"},
#                       "Amount": {"N": "6.98"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170609-10699"},
#                       "Amount": {"N": "122.52"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20160630-25621"},
#                       "Amount": {"N": "141.78"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170330-29929"},
#                       "Amount": {"N": "80.36"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "yosemitesam"},
#                       "OrderId": {"S": "20160630-4350"},
#                       "Amount": {"N": "138.93"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170330-20659"},
#                       "Amount": {"N": "47.79"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170115-20782"},
#                       "Amount": {"N": "80.05"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "yosemitesam"},
#                       "OrderId": {"S": "20170330-18781"},
#                       "Amount": {"N": "98.40"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "yosemitesam"},
#                       "OrderId": {"S": "20170330-1645"},
#                       "Amount": {"N": "25.53"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170115-2268"},
#                       "Amount": {"N": "37.30"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170609-8267"},
#                       "Amount": {"N": "32.13"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20170330-3572"},
#                       "Amount": {"N": "126.17"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20171129-28042"},
#                       "Amount": {"N": "83.12"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "yosemitesam"},
#                       "OrderId": {"S": "20170609-481"},
#                       "Amount": {"N": "136.68"}
#                   }
#               }
#           }
#       ]
#   }' \

# 3 - QUERY items
# aws dynamodb query \
#     --table-name UserOrdersTable \
#     --key-condition-expression "Username = :username" \
#     --expression-attribute-values '{
#         ":username": { "S": "daffyduck" }
#     }' \
#     --select COUNT \

# 4 - Parallel SCAN
# aws dynamodb scan \
#   --table-name UserOrdersTable \
#   --total-segments 3 \
#   --segment 1 \

# DELETE table before re-create and add LSI
# aws dynamodb delete-table \
#     --table-name UserOrdersTable \

# 5 - ADD LSI
# aws dynamodb create-table \
#   --table-name UserOrdersTable \
#   --attribute-definitions '[
#     {
#         "AttributeName": "Username",
#         "AttributeType": "S"
#     },
#     {
#         "AttributeName": "OrderId",
#         "AttributeType": "S"
#     },
#     {
#         "AttributeName": "Amount",
#         "AttributeType": "N"
#     }
#   ]' \
#   --key-schema '[
#     {
#         "AttributeName": "Username",
#         "KeyType": "HASH"
#     },
#     {
#         "AttributeName": "OrderId",
#         "KeyType": "RANGE"
#     }
#   ]' \
#   --local-secondary-indexes '[
#     {
#         "IndexName": "UserAmountIndex",
#         "KeySchema": [
#             {
#                 "AttributeName": "Username",
#                 "KeyType": "HASH"
#             },
#             {
#                 "AttributeName": "Amount",
#                 "KeyType": "RANGE"
#             }
#         ],
#         "Projection": {
#             "ProjectionType": "KEYS_ONLY"
#         }
#     }
#   ]' \
#   --provisioned-throughput '{
#     "ReadCapacityUnits": 1,
#     "WriteCapacityUnits": 1
#   }' \

# 6 - QUERY by LSI
# aws dynamodb query \
#   --table-name UserOrdersTable \
#   --index-name UserAmountIndex \
#   --key-condition-expression "Username = :username AND Amount > :amount" \
#   --expression-attribute-values '{
#       ":username": { "S": "daffyduck" },
#       ":amount": { "N": "100" }
#   }' \

#7 - ADD GSI
# aws dynamodb update-table \
#     --table-name UserOrdersTable \
#     --attribute-definitions '[
#       {
#           "AttributeName": "ReturnDate",
#           "AttributeType": "S"
#       },
#       {
#           "AttributeName": "OrderId",
#           "AttributeType": "S"
#       }
#     ]' \
#     --global-secondary-index-updates '[
#         {
#             "Create": {
#                 "IndexName": "ReturnDateOrderIdIndex",
#                 "KeySchema": [
#                     {
#                         "AttributeName": "ReturnDate",
#                         "KeyType": "HASH"
#                     },
#                     {
#                         "AttributeName": "OrderId",
#                         "KeyType": "RANGE"
#                     }
#                 ],
#                 "Projection": {
#                     "ProjectionType": "ALL"
#                 },
#                 "ProvisionedThroughput": {
#                     "ReadCapacityUnits": 1,
#                     "WriteCapacityUnits": 1
#                 }
#             }
#         }
#     ]' \

# aws dynamodb batch-write-item \
#   --request-items '{
#       "UserOrdersTable": [
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "alexdebrie"},
#                       "OrderId": {"S": "20160630-12928"},
#                       "Amount": {"N": "142.23"},
#                       "ReturnDate": {"S": "20160705"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "daffyduck"},
#                       "OrderId": {"S": "20170608-10171"},
#                       "Amount": {"N": "18.95"},
#                       "ReturnDate": {"S": "20170628"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "daffyduck"},
#                       "OrderId": {"S": "20170609-25875"},
#                       "Amount": {"N": "116.86"},
#                       "ReturnDate": {"S": "20170628"}
#                   }
#               }
#           },
#           {
#               "PutRequest": {
#                   "Item": {
#                       "Username": {"S": "yosemitesam"},
#                       "OrderId": {"S": "20170609-18618"},
#                       "Amount": {"N": "122.45"},
#                       "ReturnDate": {"S": "20170615"}
#                   }
#               }
#           }
#       ]
#   }' \
# 8 - Query GSI
aws dynamodb scan \
    --table-name UserOrdersTable \
    --index-name ReturnDateOrderIdIndex \
