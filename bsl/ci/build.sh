#!/bin/sh




cd $PROJECT_SRC_ROOT

result=0
if [ $PROJECT_BUILD_ROOT -eq 1 ] ; then
	echo "[build.sh]Build the maven root : $PROJECT_SRC_ROOT..."
	mvn install -Dmaven.test.skip=true	
else 
	echo "[build.sh]Skip build the maven root."	
fi #end if


for target in ${PROJECT_BUILD_MODULES[@]}
do
  cd $PROJECT_SRC_ROOT/$target
  mvn install -Dmaven.test.skip=true
done

if [ $result -eq 1 ] ; then
	echo "[build.sh]Build project success!"
else
	echo "[build.sh]Build failure!"
fi	

