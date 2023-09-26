#!/bin/bash
LANG=en_us_8859_1
echo "please enter start date"
read start_date
echo "please enter end date"
read end_date

while [ `date -d "$start_date" +%Y%m%d` -lt `date -d "$end_date" +%Y%m%d` ];do

	start_year=`date -d "$start_date" +%Y`
	start_month=`date -d "$start_date" +%b`
	start_day=`date -d "$start_date" +%d`
	echo "$start_month $start_day"
	end_year=`date -d "$end_date" +%Y`

	months_arr=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")

	for year in $(seq "$start_year" "$end_year");do
		
		mkdir "$year"
		cd "$year"
		for month in ${months_arr[@]};do
			mkdir "$month"
			cd "$month"

			if [ "$month" == "Feb" ];then
				if ((year % 4 == 0));then
					if ((year % 100 != 0)) || ((year % 400 == 0));then
						for day in {1..29};do
							mkdir "$day"
						done
					fi
				else
					for day in {1..28};do
						mkdir "$day"
					done
				fi
			elif [ "$month" == "Apr" ] || [ "$month" == "Jun" ] || [ "$month" == "Sep" ] || [ "$month" == "Nov" ];then
				for day in {1..30};do
					mkdir "$day"
				done
			else 
				for day in {1..31};do
					mkdir "$day"
				done
			fi
			cd ..
	done
		cd ..
	done
	break 1
done
