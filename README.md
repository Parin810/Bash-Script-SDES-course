# Bash-Script-SDES-course

Exercise 1: CSV manipulation using "AWK"

Part A.csv consists of the marks of students in part A of exam and Part B.csv consist of part b marks of students qualifying part A

Output result file which contains total marks of students in part A and part B.

With students not qualifying part A, part B marks will be "NC" i.e. not checked. 

#Output result format :

Sr.Num., RollNum, Name, part A, part B, Total, IsTied:Yes-No

1, 101010, Name of topper, 32, 56, 88, No

2, 121010, Name of second, 33, 50, 83, No
---------------------


Exercise 2 : CSV manipulation (filtering) using bash
--------------------
a script that does the following

            executes in a directory that has many rollnumber.sh files

            this script just looks for all rollnumber.sh files (except its  		    own name).

            call this script file: ceed_partsAB_checker.sh

            makes a directory called rollnumber and moves the rollnumber.sh there and runs each rollnumber.sh on dummy files partA.csv and partB.csv

            compares against correct file for templates

            awards a mark out of 10 (depending on the grading rule)

            makes ONE csv file for all rollnumbers with columns

            rollnum-header, mark-header rollnum, mark rollnum, mark 		    rollnum, mark

            (to simplify your assignment, your script can assume each student's script terminates, and no need of a "time-out" outer loop to save oneself from others' infinite loops!


