# Elasticsearch exercise scripts

## Prerequisites

- Before u get into it, you have to configure the elasticsearch to be accessible w/ HTTP.
- For example, the command below makes you to access the elasticsearch installed on your kubernetes cluster:


```bash
kubectl port-forward service/elasticsearch-master -n ${NAMESPACE} --address 0.0.0.0 29200:9200
```

- Also, u have to make `.env` file to setup an URL for the elasticsearch like:

```bash
cat << EOF > .env
ES_URL="localhost:9200"
EOF
```

## Try them on ur own

- U can `source` a script to import a certain chapter on your current shell:

```bash
source ./01-index.sh
```

- And u can try a certain step with calling the function for it:

```bash
prac_01_01
```
