#!/bin/sh
. $POSTUREPATH/config/config.sh

# print logo
print_logo(){
    echo "\033[34m
==========================================================================
'########:::'#######:::'######::'########:'##::::'##:'########::'########:
 ##.... ##:'##.... ##:'##... ##:... ##..:: ##:::: ##: ##.... ##: ##.....::
 ##:::: ##: ##:::: ##: ##:::..::::: ##:::: ##:::: ##: ##:::: ##: ##:::::::
 ########:: ##:::: ##:. ######::::: ##:::: ##:::: ##: ########:: ######:::
 ##.....::: ##:::: ##::..... ##:::: ##:::: ##:::: ##: ##.. ##::: ##...::::
 ##:::::::: ##:::: ##:'##::: ##:::: ##:::: ##:::: ##: ##::. ##:: ##:::::::
 ##::::::::. #######::. ######::::: ##::::. #######:: ##:::. ##: ########:
==========================================================================
\033[0m"
}

# print warn message.
print_ok() {
    printf "\033[34m$1\033[0m"
}

# print error message.
print_error() {
    printf "\033[31m$1\033[0m"
}

# print warn message.
print_warn() {
    printf "\e[33m$1\e[0m"
}

# loading
loading(){
    sleepSeconds=0.2
    if [ "${loadingSpeed}" == 1 ]; then
        sleepSeconds=0.2
    elif [ "${loadingSpeed}" == 2 ]; then
        sleepSeconds=0.1
    elif [ "${loadingSpeed}" == 3 ]; then
        sleepSeconds=0.05
    elif [ "${loadingSpeed}" == 4 ]; then
        sleepSeconds=0.025
    elif [ "${loadingSpeed}" == 5 ]; then
        sleepSeconds=0.01
    fi

    printf "\n"
    b=''
    i=0
    while [ $i -le 100 ]
    do
        printf "\033[32m""[%-50s] %d%%""\033[0m""\r" "$b" "$i";
        sleep $sleepSeconds
        ((i=i+2))
        b+='#'
    done
    printf "\n"
}

# send web hook message
send_ding_message(){
    message=$1
    if [ "${message}" == "" ]; then
        print_error "钉钉消息不能为空 (The DingDing message must not be empty)"
        return 0
    fi
    if [ "${dingToken}" == "" ]; then
        print_error "钉钉Token不能为空 (The DingDing token must not be empty)"
        return 0
    fi

    curl -H 'Content-type: application/json' -d "{\"msgtype\":\"text\", \"text\": {\"content\":\"${message}\"}}" "https://oapi.dingtalk.com/robot/send?access_token=${dingToken}"
}

# write commit log
write_commit_log(){
    day=$(date "+%Y%m%d")
    datetime=$(date "+%Y-%m-%d/%H:%M:%S")
    projectName=$(git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//')
    commitUser=$1
    commitBranch=$2
    commitId=$3
    commitMsg=$4
    echo "${datetime} ${projectName} ${commitUser} ${commitBranch} ${commitId} ${commitMsg}" >> $POSTUREPATH/storage/commit.${day}.log
}

# check the language.
check_lang(){
    if [ "${lang}" == "go" ]; then
        return 0
    elif [ "${lang}" == "java" ]; then
        return 0
    elif [ "${lang}" == "js" ]; then
        return 0
    elif [ "${lang}" == "php" ]; then
        return 0
    elif [ "${lang}" == "shell" ]; then
        return 0
    fi
    return 1
}

# check the config
check_config(){
    check_lang
    if [ $? -ne 0 ]; then
        print_error "lang配置错误: ${lang} (configuration of lang is error: ${lang})"
        exit 1
    fi
}
