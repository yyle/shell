#!/bin/bash
#批量修改远程branch的名称　解决项目长期积累的branch，将近期的branch排到前面（branch根据字母顺序进行排序，将branch以zz开头，可排到后面）

#输入变量（将要修改的branch含有的字母）
FILE1=$1
#将要修改后的branch的前缀
PREFX='zz'
#查询指定关键字的branch,并排除指定prefx的branch
BRANCHS=`git branch -r | grep $FILE1 | grep -v $PREFX`

#循环处理
for branch in $BRANCHS
do
#去除远程branch 中的　origin
oldBranch=${branch/origin\//}
#切换到该branch（切换到本地疯子）
git checkout $oldBranch
#修改后的branch名称
newBranch=zz/${oldBranch};
#修改branch名称
git branch -m $oldBranch $newBranch
#删除远程branch
git push origin :$oldBranch
#将新的branch进行提交
git push --set-upstream origin $newBranch
echo $oldBranch 'to' $newBranch
#处理后删除本地branch
git branch -D ${newBranch}
done