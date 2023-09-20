function apt_list_repos() {
    sudo cat /etc/apt/sources.list /etc/apt/sources.list.d/*.list | grep -vE '#|^$'
}
