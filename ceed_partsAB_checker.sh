#!/bin/bash

mkdir rollnumber  

## remove .sh files and give them execute permission

for i in $(ls | grep "[0-9].sh")
do
mv $i rollnumber 
chmod u+x rollnumber/$i    
done

# copy required files
cp partA.csv partB.csv template.csv rollnumber
cd rollnumber

#make result file
echo "roll-num","marks" > result.csv

#use diff to check if the output and templates differ

for i in $(ls | grep "[0-9].sh")
do
bash $i
evaluate=$(diff -q 'final-output.csv' 'template.csv' | cut -d " " -f 5 -)
if [ "$evaluate" == "differ" ]
then
{
	echo "$evaluate"
	echo "$i,0" | sed 's/[.sh]//g' >> result.csv
}
else
   echo "$i,10" | sed 's/[.sh]//g' >> result.csv
fi	
done 



