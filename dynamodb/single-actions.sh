# 1 - CREATE NEW TABLE
# aws dynamodb create-table \
#   --table-name UsersTable \
#   --attribute-definitions '[
#     {
#         "AttributeName": "Username",
#         "AttributeType": "S"
#     }
#   ]' \
#   --key-schema '[
#     {
#         "AttributeName": "Username",
#         "KeyType": "HASH"
#     }
#   ]' \
#   --provisioned-throughput '{
#     "ReadCapacityUnits": 1,
#     "WriteCapacityUnits": 1
#   }' \

# 2 - LIST TABLES
# aws dynamodb list-tables

# 3 - INSET ONE ITEM
# aws dynamodb put-item \
#     --table-name UsersTable \
#     --item '{
#       "Username": {"S": "daffyduck"},
#       "Name": {"S": "Daffy Duck"},
#       "Age": {"N": "81"}
#     }' \

# 4 - GET ITEM
aws dynamodb get-item \
    --table-name UsersTable \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \

# 5- GET ITEM with expression
aws dynamodb get-item \
    --table-name UsersTable \
    --projection-expression "#a, #u" \
    --expression-attribute-names '{
      "#a": "Age",
      "#u": "Username"
    }' \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \
