#!/bin/bash

# great cheatsheet https://devhints.io/bash

a=3
echo "$a"

for i in 1 2 3 4
do
    echo "hello $i"
done

# for bash 4.0 or newer
echo "Current bash version: $BASH_VERSION";
for i in {1..10..3}
do
    echo "hello haha $i"
done

#outdated

for i in $(seq 1 20 4)
do
    echo "hello sq $i"
done

# if and utils

test1=2

test $test1 -lt 3
echo "2 < 3: $?"

if test $test1 -ge 2
then
    echo "test1 -ge 2"
fi

# enclosing in bash

# about {} https://askubuntu.com/questions/606378/when-to-use-vs-in-bash
# {} do is executed in current scope (context)

# ()
#   shell command in subprocess (new scope)
#   do not affect current environment
#   `` have same effect to $()

# ((  ))
#   bash extension for c-styly variable manipulation
a=1
((a++)) # a == 2

# [  ] POSIX builtin, same as test
#   so
#   test 2 -eq 2
#       is same as
#   [ 2 -eq 2 ]

# [[  ]]
#   bash extension
#       string supports wildcat pattern
#       supports ==
if [[ 2==2 ]]
then
    echo "2==2"
fi

if [[ "haha" == h* ]]
then
    echo "haha match h*"
fi

no_keyword_func() {
    echo "Function without function prefix has been invoked.";
}

function keyword_func() {
    echo "Function with keyword invoked";
}

keyword_func
no_keyword_func

s1="im global s1!"
s2="im global s2!"

function scopeTest() {
    local s1="im local s1!"

    s1="im changed local s1!"
    echo "s1: $s1 s2: $s2"
}
scopeTest

function withReturnValueOnlyNum() {
    #works only with numers
    return 2
}

withReturnValueOnlyNum

return_value=$?

echo "Function returned $return_value"

function funcWithStringReturn() {
    returnString="I'm string returned from function!"
}

if [ -z "{returnString+x}" ]
then
    echo "Function initialized (returned) string value: $returnString"
else
    echo "Function does't returned anything."
fi

funcWithStringReturn

# or you can return to stdout (preffered)

function return_to_stdout() {
    local my_ret="im returned to stdout"
    echo $my_ret
}

ret="$(return_to_stdout)"
echo "Function returned to stout: $ret"

# inout variables to script
# amount_of_args=$#
# echo "You specifed $amount_of_args arguments"
# echo "Filename: $0"

if [[ $# != 0 ]]
then
    echo "Provided args to the function:"
    for arg in $*
    do
        echo $arg
    done
else
    echo "Please provide arguments for script to display them."
fi