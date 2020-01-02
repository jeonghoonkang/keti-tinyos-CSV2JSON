#!/bin/bash
# 파이션 코드 실행스크립트
# version 2.0
# Author : Chaechulseung, Hyungkoo Kimm, Jeonghoon Kang 


printf "원하는 작업종류의 번호를 입력해주세요[ 1 (CSV to JSON) / 2 (JSON field key change)('Enter' => 1) ] : "
read input0
work=''$input0

if [ "${work}" == '' ]
then
    work='1'
fi


if [ ${work} == '1' ]
then
    #### 사용자 설정 부분
    MainCode='CSVJSON_main.py'

    # file_type은 csv/xlsx중 선택
    file_type='csv'
    input_dir='./originalCSVData'
    printf "\n원본 CSV 파일 위치를 입력해 주세요. originalCSVData 디렉토리 사용을 원할 시 [enter].\n"
    printf "./originalCSVData"
    read input00
    input_dir=$input_dir$input00
    #echo $input_dir
    
    #output 파일, 한 개 당 json 갯수 
    bundle=250000

    printf "\n파일 갱신중... 잠시만 기다려 주세요\n"

    time python CSVJSON_INPUT.py $file_type $input_dir 

    printf "JSON으로 변환할 파일 종류 번호를 입력해주세요 ('Enter' => 1): "
    read input1
    if [ "${input1}" == '' ]
    then
        input1='1'
    fi
    filekind=${input1}
    
    printf "JSON으로 변환할 field 번호를 입력해주세요 ('Enter' => 13): "
    read input2
    if [ "${input2}" == '' ];then
        input2='13'
    fi
    field=${input2}

    printf "timestamp로 지정 할 field 번호를 입력해주세요 ('Enter' => 28): "
    read input3
   if [ "${input3}" == '' ];then
        input3='28'
    fi
    ts=${input3}

    printf "car ID로 지정 할 field 번호를 입력해주세요 ('Enter' => 27): "
    read input4
   if [ "${input4}" == '' ];then
        input4='27'
    fi
    carid=${input4}

    printf "Json에 쓰여질 metric이름을 입력해주세요 ('Enter' = testmetric): "
    read input5
    if [ "${input5}" == '' ];then
        input5='testmetric'
    fi
    metric=${input5}

    printf "생산자의 수(Pn)을 입력하세요 ('Enter' = 4): "
    read input6
    if [ "${input6}" == '' ];then
        input6='4'
    fi
    pn=${input6}

    printf "소비자의 수(Cn)을 입력하세요 ('Enter' = 2): "
    read input7
    if [ "${input7}" == '' ];then
        input7='2'
    fi
    cn=${input7}

    output_dir=$input_dir'/sw_make'

    printf ""
    echo ">>===================================================="
    echo "실행 관련 주요 정보"
    echo $MainCode $file_type $bundle $filekind $field $ts $carid $metric $output_dir $pn $cn
    echo "====================================================<<"


    # time 은 스크립트 SW 실행 시간을 확인하기 위해 사용 
    # 인자값 4개 
    time python $MainCode -debug -filetype $file_type -jsonpack $bundle -filekind $filekind -field $field -ts $ts -carid $carid -metric $metric -outdir $output_dir -pn $pn -cn $cn

    echo " *** end script run for PYTHON *** "
elif [ ${work} == '2' ]
then
    #### 사용자 설정 부분
    MainCode='CSVJSON_change.py'

    printf "JSON파일에서 변환할 인자를 입력해주세요 (key or value 중 하나) : "
    read input4
    rename_field=${input4}
    python json_parsing.py -debug -rename_field $rename_field

    printf "변환할 key/value를 입력해주세요 (공백은 '@'로 대체) : "
    read input5
    strold=${input5}

    printf "변환될 key/value를 입력해주세요 (공백은 '@'로 대체) : "
    read input6
    strnew=${input6}

    printf ""
    echo ">>===================================================="
    echo "실행 관련 주요 정보"	echo "실행 관련 주요 정보"
    echo $MainCode $rename_field $strold $strnew
    echo "====================================================<<"

    # time 은 스크립트 SW 실행 시간을 확인하기 위해 사용
    # 인자값 3개
    time python $MainCode -debug -rename_field $rename_field -strold $strold -strnew $strnew

    echo " *** end script run for PYTHON *** "
else
    echo "잘못입력했습니다. 1,2 중 하나를 입력해주세요."
fi
