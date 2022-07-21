# Elasticsearch exercise scripts

## Prerequites

- Before u get into it, you have to configure the elasticsearch to be accessible from the outside
- For example, the command below makes you to access the elasticsearch which is installed on your kubernetes cluster:


```bash
kubectl port-forward service/elasticsearch-master -n ${NAMESPACE} --address 0.0.0.0 29200:9200
```

## Try them on ur own

- U can `source` a script to import a certain chapter on your current shell:

```bash
source ./01-index.sh
```

- And u can try a certain step with calling the function:

```bash
prac_01_01
```
