#!/bin/bash

source ./.env

# Advanced-01.01
#   Elasticsearch ILM helps managing the indices
#   By creating index policy, you can make policies like log-rotating policy:
#
#   `http://$ELASTICSEARCH_URL/_ilm/policy/$POLICY_NAME` with PUT method
#
#   Here's a simple example of creating an index policy:
function prac_01_01 {
    curl -X PUT $ES_URL/_ilm/policy/log_rotate \
        -H "Content-Type: application/json" \
        -d '
        {
            "policy": {
                "phases": {
                    "hot": {
                        "actions": {
                            "rollover": {
                                "max_primary_shard_size": "1GB"
                            }
                        }
                    },
                    "delete": {
                        "min_age": "1d",
                        "actions": {
                            "delete": {}
                        }
                    }
                }
            }
        }'
}

# Advanced-01.02
#   Index template is kinda preset of the indices to apply some settings
#   to the newly created index
#   By creating an index template w/ `index_pattern` specified,
#   u can apply the settings to the index which name is matched w/ that `index_pattern`
#
#   Creating an index template is like:
#
#   `http://$ELASTICSEARCH_URL/_index_template/$INDEX_TEMPLATE_NAME` with PUT method
#
#   One common way to apply the index policy to the indices is using an index template
#   The official documentation states that it's recommended to use the index template
#   when u want to the index policy to the index
#
#   A simple example of creating an index template is as follows:
function prac_01_02 {
    curl -X PUT $ES_URL/_index_template/fluentd_index_template \
        -H "Content-Type: application/json" \
        -d '
        {
            "index_patterns": ["fluentd.*"],
            "template": {
                "settings": {
                    "number_of_shards": 1,
                    "number_of_replicas": 1,
                    "index": {
                        "lifecycle": {
                            "name": "log-rotate",
                            "rollover_alias": "log-rollover-alias"
                        }
                    }
                }
            }
        }'
}
