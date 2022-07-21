#!/bin/bash

source ./00-basics-and-configs.sh

# 01.01
#   This is how to get docs of the certain index:
#   `http://$ELASICSEARCH_URL/$INDEX_NAME` with GET method
#   The command below might returns `IndexNotFountException` with 404
#   As an index `classes` is not created yet.
#
#   Result is something like:
#   {
#     "error" : {
#       "root_cause" : [
#         {
#           "type" : "index_not_found_exception",
#           "reason" : "no such index [classes]",
#           "index_uuid" : "_na_",
#           "resource.type" : "index_or_alias",
#           "resource.id" : "classes",
#           "index" : "classes"
#         }
#       ],
#       "type" : "index_not_found_exception",
#       "reason" : "no such index [classes]",
#       "index_uuid" : "_na_",
#       "resource.type" : "index_or_alias",
#       "resource.id" : "classes",
#       "index" : "classes"
#     },
#     "status" : 404
#   }
function prac_01_01 {
    curl -X GET http://$ES_URL/classes?pretty
}

# 01.02
#   To create a new index, you can:
#   `http://$ELASTICSEARCH_URL/$INDEX_NAME` with PUT method
#
#   Result is something like:
#   {
#     "acknowledged" : true,
#     "shards_acknowledged" : true,
#     "index" : "classes"
#   }
function prac_01_02 {
    curl -X PUT http://$ES_URL/classes?pretty
}
