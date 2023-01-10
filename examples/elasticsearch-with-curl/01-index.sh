#!/bin/bash

source ./.env

# 01.01
#   This is how to get info of the certain index:
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
#
#   After u create an index, the result of querying an index (by the prac_01_01) is something like:
#   {
#     "classes" : {
#       "aliases" : { },
#       "mappings" : { },
#       "settings" : {
#         "index" : {
#           "routing" : {
#             "allocation" : {
#               "include" : {
#                 "_tier_preference" : "data_content"
#               }
#             }
#           },
#           "number_of_shards" : "1",
#           "provided_name" : "classes",
#           "creation_date" : "1658389981117",
#           "number_of_replicas" : "1",
#           "uuid" : "4QU3eUm2QNC_Kyw7ZgzB2Q",
#           "version" : {
#             "created" : "7170199"
#           }
#         }
#       }
#     }
#   }
function prac_01_02 {
    curl -X PUT http://$ES_URL/classes?pretty
}

# 01.03
#   If u wanna delete an index, you can:
#   `http://$ELASTICSEARCH_URL/$INDEX_NAME` with DELETE method
#
#   And the result looks like:
#   {
#     "acknowledged" : true
#   }
#
#   If there is no such index, response staus will be 404 with "index_not_found_exception"
function prac_01_03 {
    curl -X DELETE http://$ES_URL/classes?pretty
}

# 01.04
#   This is how to query all indices in the cluster
#   `http://$ELASTICSEARCH_URL/_cat/indices` with GET method
#
#   And the result looks like:
#   green open logstash-2022.07.26 D_gJd0arQ6qVRrbf8r5Ugw 1 1 7043 0   1.2mb 636.5kb
#   green open fluentd             h6KI7yj_TyG87x0mCI6UbQ 1 1 3093 0 433.1kb 216.5kb
function prac_01_04 {
    curl -X GET http://$ES_URL/_cat/indices
}
