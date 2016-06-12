#!/bin/bash  
使用bash

stdout to file

 	ls -l > ls-l.txt

stderr to file
	grep da * 2> grep-errors.txt

| pipe
Pipes let you use (very simple, I insist) the output of a program as the input of another one
	 ls -l | sed -e "s/[aeio]/u/g"   
 first the command ls -l is executed, and it's output, instead of being printed, is sent (piped) to the sed program, which in turn, prints what it has to.

定义变量
	STR="Hello World!"
注意，这里不过有空格，如果有空格的话，Shell会当做一个函数来处理

这里
	echo $STR
	echo "$STR"
结果是一样的

	echo ls
	echo $(ls)
前面一个是直接就打印了ls这两个字符，后面一个是执行了ls这个函数

函数和局部变量
 function hello {
                        local HELLO=World
                        echo $HELLO
                }
其中local就是局部变量

条件控制
if [ "foo" = "foo" ]; then
               echo expression evaluated as true
            else
               echo expression evaluated as false
            fi

比较两个变量，这里"$T1"已经是在调用一个变量的值了。

if [ "$T1" = "$T2" ]; then
                echo expression evaluated as true
            else
                echo expression evaluated as false
            fi

主要的结构是
if [expr]; then  ##The test command needs to be in the form "operand1<space>operator<space>operand2" or operator<space>operand2 , 
	sentence
elif
	sentence
else
	sentence
fi

循环语句
for 循环
for i in $( ls ); do
            echo item: $i
        done
或者
for i in `seq 1 10`;
        do
                echo $i
        done

while循环
COUNTER=0
while [  $COUNTER -lt 10 ]; do
   echo The counter is $COUNTER
   let COUNTER=COUNTER+1 
done

until循环
COUNTER=20
until [  $COUNTER -lt 10 ]; do
   echo COUNTER $COUNTER
   let COUNTER-=1
done

函数定义
 function hello {
               echo Hello!
           }
带参数
 function e {
                    echo $1 
                }  
这里是打印第一个参数
call function可以：e Hello


选择语句select

#!/bin/bash
OPTIONS="Hello Quit"
select opt in $OPTIONS; do
   if [ "$opt" = "Quit" ]; then
    echo done
    exit
   elif [ "$opt" = "Hello" ]; then
    echo Hello World
   else
    clear
    echo bad option
   fi
done

读入用户输入
echo Please, enter your firstname and lastname
read FN LN 
echo "Hi! $LN, $FN !"


关系比较符
-lt (<)

-gt (>)

-le (<=)

-ge (>=)

-eq (==)

-ne (!=)

-n	operand non zero length	-n xx
-z	operand has zero length	-z xx
-d	there exists a directory whose name is operand	-d xx
-f	there exists a file whose name is operand	 -f xx


##Using Quotes to enclose your variables

Sometimes, it is a good idea to protect variable names in double quotes. This is usually the most important if your variables value either (a) contains spaces or (b) is the empty string. An example is as follows:

#!/bin/bash
X=""
if [ -n $X ]; then 	# -n tests to see if the argument is non empty
	echo "the variable X is not the empty string"
fi

Using Braces to Protect Your Variables

OK. Here's a potential problem situation. Suppose you want to echo the value of the variable X, followed immediately by the letters "abc". Question: how do you do this ? Let's have a try :
#!/bin/bash
X=ABC
echo "$Xabc"
THis gives no output. What went wrong ? The answer is that the shell thought that we were asking for the variable Xabc, which is uninitialised. The way to deal with this is to put braces around X to seperate it from the other characters. The following gives the desired result:
#!/bin/bash
X=ABC
echo "${X}abc"
