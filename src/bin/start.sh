#!/bin/bash

set -e

echo $@
echo "in start.sh"

function choose() {
    local webType="laravel"
    printf "Support web site types are:
    *1) laravel
     2) wordpress
    \n"
    read -p "Please choose web type: " webTypeNo


    case ${webTypeNo} in
        1)
            webType="laravel"
            printf "Support version are:
            *1) 5.3 / 5.4
             2）5.5"
            read -p "Please choose version: " webVersion
            case ${webVersion} in
                1)
                    return "docker-compose-laravel5.3.yml"
                ;;
            esac
        ;;
    esac

}

read -p "Please choose version: " webVersion
echo ${webType}

readonly composeFile="compose/docker-compose-${webType}${webViseion}.yml"

mv -f ${composeFile} ..
docker-compose up --build