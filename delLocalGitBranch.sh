#!/bin/bash
FILE1=$1
PREFX='zz'
#
BRANCHS=`git branch  | grep  $PREFX` #查询指定关键字的branch,并排除指定prefx的分支
for branch in $BRANCHS ; do
git branch -D ${branch}
#echo $branch;
#oldBranch=${branch/origin\//}
#git checkout $oldBranch
#newBranch=zz/${oldBranch};
#git branch -m $oldBranch $newBranch
#git push origin :$oldBranch
#git push --set-upstream origin $newBranch
#echo $oldBranch 'to' $newBranch
done