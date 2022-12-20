#!/bin/bash

source ./.env

# !! IMPORTANT !!
# Modifications for Elasticsearch 7.x
#
#   The concept `Document Type` is no longer supported in 7.x
#   Thus, all the $DOCUMENT_TYPE URL path in the examples below must be set to the `_doc`
#
#   And also, the location for `_update` and `_create` URL path is moved to the
#   $DOCUMENT_TYPE path
#   For example, before 7.x:
#       /$INDEX/$DOCUMENT_TYPE/$DOCUMENT_ID/_update
#   But after 7.x:
#       /$INDEX/_update/$DOCUMENT_ID

# 02.01
#   Creating a document can be done with:
#
#   `http://$ELASTICSEARCH_URL/$INDEX/_doc/$DOCUMENT_ID -d $JSON` with POST method
#   Doesn't matter whether the index is already created; The index will be created automatically
#   when there's no such index
#
#   Result looks like:
#   {
#     "_index" : "foods",
#     "_type" : "food",
#     "_id" : "1",
#     "_version" : 1,
#     "result" : "created",
#     "_shards" : {
#       "total" : 1,
#       "successful" : 1,
#       "failed" : 0
#     },
#     "_seq_no" : 1,
#     "_primary_term" : 1
#   }
function prac_02_01 {
    curl -X POST \
        -H "Content-Type: application/json" \
        -d '{"menu": "chicken", "price": "1000000$"}' \
        http://$ES_URL/foods/_doc/1?pretty
}

# 02.02
#   U can create a document with the file path:
#
#   `http://$ELASTICSEARCH_URL/$INDEX/_doc/$DOCUMENT_ID -d @$FILE_PATH` with POST method
#   As u can see, specifying file path with `@` prefix can pass the file to the elasticsearch.
#
#   Result looks like:
#   {
#     "_index" : "foods",
#     "_type" : "food",
#     "_id" : "2",
#     "_version" : 1,
#     "result" : "created",
#     "_shards" : {
#       "total" : 2,
#       "successful" : 2,
#       "failed" : 0
#     },
#     "_seq_no" : 1,
#     "_primary_term" : 1
#   }
function prac_02_02 {
    curl -X POST \
        -H "Content-Type: application/json" \
        -d @02-02-post.json \
        http://$ES_URL/foods/_doc/2?pretty
}

# 02.03
#   There are some alternatives for creating a new document with POST method:
#
#   1. U can omit the $DOCUMENT_ID
#       This will generate a random ID for the document
#
#   And the result is:
#   {
#     "_index" : "foods",
#     "_type" : "_doc",
#     "_id" : "57x1PYIBlTl9hLubrKqV",   <-- Random ID!
#     "_version" : 1,
#     "result" : "created",
#     "_shards" : {
#       "total" : 2,
#       "successful" : 2,
#       "failed" : 0
#     },
#     "_seq_no" : 3,
#     "_primary_term" : 1
#   }
function prac_02_03 {
    curl -X POST \
        -H "Content-Type: application/json" \
        -d '{"menu": "gamja", "price": "1$"}' \
        http://$ES_URL/foods/_doc?pretty
}

# 02.04
#   2. U can use `_create` instead of `_doc` in the $DOCUMENT_TYPE path
#       `_doc` URL path with POST method overwrites existing document (which has same ID)
#       But using `_create` prevents you from overwriting it
#
#   But u can't use `_create` if u wanna create a document w/ random ID
#   That request will be failed w/ response 400
#
#   And the result be like:
#   {
#     "_index" : "foods",
#     "_type" : "_doc",
#     "_id" : "3",
#     "_version" : 1,
#     "result" : "created",
#     "_shards" : {
#       "total" : 2,
#       "successful" : 2,
#       "failed" : 0
#     },
#     "_seq_no" : 2,
#     "_primary_term" : 1
#   }
function prac_02_04 {
    curl -X POST \
        -H "Content-Type: application/json" \
        -d '{"menu": "gamja", "price": "1$"}' \
        http://$ES_URL/foods/_create/3?pretty
}

# 02.05
#   Getting a document can be done like:
#
#   `http://$ELASTICSEARCH_URL/$INDEX/_doc/$DOCUMENT_ID` with GET method
#
#   And the result be like:
#   {
#     "_index" : "foods",
#     "_type" : "food",
#     "_id" : "2",
#     "_version" : 1,
#     "_seq_no" : 1,
#     "_primary_term" : 1,
#     "found" : true,
#     "_source" : {
#       "menu" : "kimchi",
#       "price" : "9999$"
#     }
#   }
function prac_02_05 {
    curl -X GET http://$ES_URL/foods/_doc/2?pretty
}

# 02.06
#   This is how to update a document:
#
#   `http://$ELASTICSEARCH_URL/$INDEX/_update/$DOCUMENT_ID -d $JSON` with PUT method
#   One of the formats of the $JSON part is specifying key to update and its updated value
#   in the "doc" field:
#   {
#     "doc": {
#       $KEY_TO_UPDATE1: $UPDATE_VALUE1,
#       $KEY_TO_UPDATE2: $UPDATE_VALUE2,
#       ...
#     }
#   }
#
#   Result looks like:
#   {
#     "_index" : "foods",
#     "_type" : "food",
#     "_id" : "2",
#     "_version" : 2,
#     "result" : "updated",
#     "_shards" : {
#       "total" : 2,
#       "successful" : 2,
#       "failed" : 0
#     },
#     "_seq_no" : 2,
#     "_primary_term" : 2
#   }
function prac_02_06 {
    curl -X PUT \
        -H "Content-Type: application/json" \
        -d '{"doc": {"price": 9999}}' \
        http://$ES_URL/foods/_update/2?pretty
}

# 02.07
#   Using PUT method provides very similar functionalities with the POST method
#
#   Both PUT and POST can create a new document (with `_doc` or `_create` URL path)
#   Both PUT and POST can update a document (with `_doc` or `_update` URL path)
#
#   But the difference is that while POST method can generate random ID for the document,
#   PUT method can't
function prac_02_07 {
    curl -X POST \
        -H "Content-Type: application/json" \
        -d '{"doc": {"price": 99999}}' \
        http://$ES_URL/foods/_update/2?pretty
}

# 02.08
#   Elasticsearch provides `script` for updating the document
#
#   The request body for using `script` looks like:
#   {
#     "script": "ctx._source.$VALUE_UPDATE_SCRIPT"
#   }
#   U can use various operators like `+=` or `-=` in the $VALUE_UPDATE_SCRIPT part
#   in addition to the `=` operator
#
#   Result looks like:
#   {
#     "_index" : "foods",
#     "_type" : "food",
#     "_id" : "2",
#     "_version" : 3,
#     "result" : "updated",
#     "_shards" : {
#       "total" : 2,
#       "successful" : 2,
#       "failed" : 0
#     },
#     "_seq_no" : 3,
#     "_primary_term" : 2
#   }
function prac_02_08 {
    curl -X POST \
        -H "Content-Type: application/json" \
        -d '{"script": "ctx._source.price*=0.7"}' \ # Discount 30% !!
        http://$ES_URL/foods/_doc/2/_update?pretty
}

# 02.09
#   `Bulk` API for the Elasticsearch is to perform the multiple CRUD APIs sequentially
#   In most cases, using `Bulk` API is more faster than performing each API one-by-one
#   Thus, most of the clients like Logstash uses `Bulk` API to insert a lot of data
#
#   The JSON-styled script for using `Bulk` API be like:
#
#   // 02-06-bulk.json
#   {"index": {"_index": "foods", "id": "3"}}       // Creating a document w/ "index" field
#   {"menu": "soju", "price": "2$"}                 // Document to create
#   {"index": {"_index": "foods", "id": "4"}}       // Creating another document
#   {"menu": "korean-barbeque", "price": "20$"}     // Document to create
#   {"create": {"_index": "foods", "id": "5"}}      // Creating another document w/ "create" field
#   {"menu": "pajeon", "price": "20$"}              // Document to create
#   {"update": {"_index": "foods", "id": "4"}}      // Updating a document w/ "update" field
#   {"doc": {"price": "20$"}}                       // Update to ...
#   {"delete": {"_index": "foods", "id": "5"}}      // Delete a document w/ "delete" field
#
#   As u can see, creating and updating a document requires 2 JSON string and
#   deleting a document requires only 1 JSON string
#
#   Note that the `Bulk` API is not a transaction
#   Elasticsearch doesn't guarantees ACID and doesn't have concepts like transaction
#   So the data is not rolled-back when the `Bulk` API fails
#   U have to clear the index on ur own to undo the `Bulk` API
#
#   This is how to use `Bulk` API:
#   `http://$ELASTICSEARCH_URL/_bulk --data-binary @$JSON_FILE` with POST method
#   Strictly speaking, `Bulk` file is not a JSON format, but it's not a big deal
#
#   And the result be like:
#   {
#     "took" : 61,
#     "errors" : false,
#     "items" : [
#       {
#         "index" : {
#           "_index" : "foods",
#           "_type" : "_doc",
#           "_id" : "3",
#           "_version" : 1,
#           "result" : "created",
#           "_shards" : {
#             "total" : 2,
#             "successful" : 2,
#             "failed" : 0
#           },
#           "_seq_no" : 7,
#           "_primary_term" : 2,
#           "status" : 201
#         }
#       },
#       ... and more ...
#     ]
#   }
function prac_02_09 {
    curl -X POST \
        -H "Content-Type: application/json" \
        --data-binary @02-06-bulk.json \
        http://$ES_URL/_bulk?pretty
}
