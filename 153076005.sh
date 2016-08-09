#!/bin/bash
echo "Sr.Num","RollNum","partA","partB","Total","IsTied:Yes-No" > temp.csv
echo "CEED Exam" > statistics.txt
awk -F, 'FNR==NR{Rollb[$1]=$1;Marksb[$1]=$2;next}

 
FNR!=NR{
	Rolla[$1]=$1;
	Marksa[$1]=$2;
	Total[$1]=0; 
	for (i in Marksa)
	{
		if ((Rollb[i]-i) == (Rolla[i]-i))
		
			Total[i]=Marksa[i] + Marksb[i]
		 else
		 {
			Marksb[i]="NC"
			Total[i]=Marksa[i]
		 }
	 }
	
	
	print $0 "," Marksb[$1] "," Total[$1]}' partB.csv partA.csv | sed '1d' - | sort -t ',' -k 4 -nr >> temp.csv
	
	
	echo "Total students : $(cat partA.csv | sed 1d - | wc -l)" >> statistics.txt
	echo "Students qualifying Part A : $(cat partB.csv | sed 1d - | wc -l)" >> statistics.txt
	echo "Students not qualifying Part A : $(grep -c "NC" temp.csv)" >> statistics.txt
	
	

##formatting and same scores

total=($(cut -d "," -f 4 temp.csv | sed 1d - )) 
istied=($(cut -d "," -f 4 temp.csv | sed 1d - | uniq -d - ))
count=$(cut -d "," -f 4 temp.csv | sed 1d - | wc -l)
array=()
#echod ${total[@]}
#echo $istied
#echo $count

length_total=${#total[@]}
length_istied=${#istied[@]}

for (( i=0; i<$length_total; i++))
do
    isset=0
        for (( j=0; j<$length_istied; j++))    
        do   
            
            if [ "${istied[j]}" == "${total[i]}" ]
            then 
                array[i]="Yes"
                isset=$((isset+1))
                
            fi
            
        done
        if [ "$isset" != "1" ]
        then
            array[i]="No"
        fi
done




echo ${array[@]} | tr -s " " "\n" | sed '1i\\' - | paste -d "," temp.csv - | awk -F, 'NR!=1 {$1=++i FS $1; a[$1]=$1}1' OFS=, - > final-output.csv

 

echo "Highest marks : $(cat final-output.csv | cut -d "," -f 5 | sed -sn 2p -)" >> statistics.txt
