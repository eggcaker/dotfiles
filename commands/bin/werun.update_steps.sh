#!/usr/bin/env bash


TOKEN=$(ssh ubuntu@182.92.204.83 "cat ~/src/werun/log/access_token.json"|jq '.accessToken'|sed -e 's/"//g')
OPENID="otSPKjueuouTjSPjtT7tbS6ycSRA";

time="$(date +'%H%M')"
#STEPS="$[time * 3]";
STEPS="8800";
TIME="$(date +'%s')"


url="https://api.weixin.qq.com/hardware/bracelet/setstep?access_token=${TOKEN}&openid=${OPENID}&step=${STEPS}&timestamp=$TIME"
curl $url


#url="https://api.weixin.qq.com/hardware/bracelet/getstep?access_token=${TOKEN}&openid=${OPENID}&timestamp=$TIME"
#echo $url;
#curl $url
