#翻译
ts(){
    words=""
    for word in $@; 
    do
        words="$words$word "
    done

    curl -s \
            "http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule&smartresult=ugc&sessionFrom=dict.top" \
         -d \
        "type=AUTO& i=$words&doctype=json&xmlVersion=1.4&keyfrom=fanyi.web&ue=UTF-8&typoResult=true&flag=false" \
            | sed -E -n 's/.*tgt":"([^"]+)".*/\1/p' ;

}

#查看天气
tq(){
    loc=$1
    if [ -z $loc ];then
        loc='Xiamen'
    fi
    curl -4 wttr.in/$loc
}
