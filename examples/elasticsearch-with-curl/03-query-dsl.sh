#!/bin/bash

source ./.env

# 03.01
#   When u want to search the documents, u can use `_search` URL path like:
#
#   `http://$ELASTICSEARCH_URL/$INDEX_NAME/_search` with GET method
#
#   The search queries can be included in the request w/ a request body or url query string
#   If you do not provided any queries, all of the docuements in the index will be searched like:
#
#   {
#     "took" : 106,
#     "timed_out" : false,
#     "_shards" : {
#       "total" : 1,
#       "successful" : 1,
#       "skipped" : 0,
#       "failed" : 0
#     },
#     "hits" : {
#       "total" : {
#         "value" : 4,
#         "relation" : "eq"
#       },
#       "max_score" : 1.0,
#       "hits" : [
#         {
#           "_index" : "foods",
#           "_type" : "_doc",
#           "_id" : "1",
#           "_score" : 1.0,
#           "_source" : {
#             "menu" : "chicken",
#             "price" : "1000000$"
#           }
#         },
#         ... and other documents ...
#       ]
#     }
#   }
function prac_03_01 {
    curl -X GET http://$ES_URL/foods/_search?pretty
}

# 03.0x
#   @see https://stackoverflow.com/a/20731628
#
#   When u want to query the latest document, u have to add date field to the index mapping
#   And then, u can query the latest one like:
function prac_03_0x {
    curl -X GET http://$ES_URL/foods/_search?pretty \
        -H "Content-Type: application/json" \
        -d '
        {
            "query": {
                "match_all": {}
            },
            "size": 1,
            "sort": [
                {
                    "@timestamp": {
                        "order": "desc"
                    }
                }
            ]
        }'
}
