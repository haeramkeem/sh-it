function find_nodeport() {
    kubectl get svc -A | grep -i nodeport | awk '{print $6}' | tr ',' '\n' | sed -E 's#.+:(3....)/(TCP|UDP)#\1#g' | sort -u
}
