function x509_validity() {
    cat "-" | openssl x509 -noout -startdate -enddate
}
