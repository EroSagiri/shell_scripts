#!/usr/bin/bash

if [ $# -lt 2 ]
then
    echo 发现地址段的网络主机
    echo pingall.sh [初始ip地址] [结束ip地址]
    exit -1
    fi
a1=`echo $1 | cut -d . -f 1`
a2=`echo $2 | cut -d . -f 1`
b1=`echo $1 | cut -d . -f 2`
b2=`echo $2 | cut -d . -f 2`
c1=`echo $1 | cut -d . -f 3`
c2=`echo $2 | cut -d . -f 3`
d1=`echo $1 | cut -d . -f 4`
d2=`echo $2 | cut -d . -f 4`


while [ $a1 -le $a2 ]
do
    while [ $b1 -le $b2 ]
    do
        while [ $c1 -le $c2 ]
        do
            while [ $d1 -le $d2 ]
            do
                ip="$a1.$b1.$c1.$d1"
                ping -c 1 -w 1 $ip &> /dev/null
                if [ $? -eq 0 ]
                then
                    echo $ip online
                fi

                d1=`expr $d1 + 1`
            done

            c1=`expr $c1 + 1`
        done

        b1=`expr $b1 + 1`
    done

    a1=`expr $a1 + 1`
done







