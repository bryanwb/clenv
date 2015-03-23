## Cloud Envy (clenv) is a tool for managing the your cloud provider configurations
## and for other cloudish tools
## source me from ~/.bashrc

current_apps=$(find ~/.clenv -name '*-current')
for app in $current_apps; do
    source "$app"
done

clenv-show(){
    if [ -z "$1" ] ; then
        current_apps=$(find ~/.clenv -name "*-current")
        for app in $current_apps; do
            actual=$(basename $(readlink $app))
            actual=$(echo -n $actual )
            echo $actual
        done
    else
        app="$1"
        current=$(find ~/.clenv -name "$app-current")
        actual=$(basename $(readlink $current))
        actual=$(echo -n $actual | sed -e "s/$app-//")
        echo $actual
    fi
}

clenv-use(){
    app="$1"
    environment="$2"
    current=$(find ~/.clenv -name "$app-current")
    if [ ! -z "$current" ] ; then
        rm "$current"
    fi
    
    ln -s ~/.clenv/$app-$environment ~/.clenv/$app-current
    source ~/.clenv/$app-current
}

