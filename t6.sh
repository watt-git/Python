#!/bin/bash
# normdate -- 将月份规范成3个字母，首字母大写。
# testtesttestsssss

monthNumToName()
{
 case $1 in
 1 ) month="Jan"    ;;    2 ) month="Feb"    ;;
 3 ) month="Mar"    ;;    4 ) month="Apr"    ;;
 5 ) month="May"    ;;    6 ) month="Jun"    ;;
 7 ) month="Jul"    ;;    8 ) month="Aug"    ;;
 9 ) month="Sep"    ;;    10) month="Oct"    ;;
 11) month="Nov"    ;;    12) month="Dec"    ;;
 * ) echo "$0: Unknown numeric month value $1" >&2
     exit 1
 esac
 return 0
} 

# ====== 主脚本 ======
# 输入验证
if [ $# -ne 3 ] ; then
    echo "Usage: $0 month day year" >&2
    echo "Formats are August 3 1962 and 8 3 1962" >&2
    exit 1
fi
if [ $3 -le 99 ] ; then
    echo "$0: expected 4-digit year value." >&2
    exit 1
fi

# 输入的月份是否为数字
if [ -z $(echo $1|sed 's/[[:digit:]]//g') ] ; then
    monthNumToName $1
else
# 规范前3个字母，首字母大写，其余小写。
    month="$(echo $1 | cut -c1 | tr '[:lower:]' '[:upper:]')"    
    month="$month$(echo $1 | cut -c2-3 |tr '[:upper:]' '[:lower:]' )"
fi

echo $month $2 $3
echo "test"

exit 0
