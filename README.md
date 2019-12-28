# CSV2JSON 소프트웨어
2019년 전자부품연구원(https://www.keti.re.kr/rnd/rnd01_05.php) 임베디드SW연구센터 에서 개발된 공개 소프트웨어 입니다
## 개요
- IoT 데이터 수집, 빅데이터 분석을 위한 처리 및 JSON 생성 소프트웨어
- 텍스트 CSV 파일을 input 받아 JSON 파일 생성

### 주요 처리 기능
1. 입력 CSV 파일의 필드 이름을 분석 
2. 디렉토리 내의 CSV 파일 갯수 카운트
3. 디렉토리 내의 CSV 파일 종류 (필드이름 다른경우) 카운트
4. JSON 으로 변환할 필드정보 출력 및 사용자 선택 받음
5. 멀티프로세싱 적용 (CSV 로딩, 필드추출, JSON 변환후 파일 저장)
6. 멀티프로세싱을 위한 프로세서 갯수 설정 기능


## 초기 개발자
- 채철승 ( https://github.com/ChulseoungChae )
- 김형구 ( https://github.com/KimHyeongGoo )
- 강정훈, Jeonghoon Kang ( https://github.com/jeonghoonkang )


## 세부기능 
- TBD

## 개발 목적, 저작권
- 본 S/W는 전자부품연구원 (KETI) 임베디드SW 연구센터에서 2019년 개발되었습니다
- 산업통산자원부와 한국산업기술평가원(KEIT)에서 주관한 2019년 국잭 프로젝트들에서 개발비가 지원되었습니다
- 국책 프로젝트의 사업화 기술 항목은 제외 되었으며, 일반목적 사용이 가능하고 장기적 활용이 가능성이 높은 기능을 공개 하였습니다
- 해당 소프트웨어는 상업용, 비상업 등 모든 사용에 대해 무료 입니다. 이에 따라서 모든 개발자, KETI, KEIT, 산업통산자원부 는 유지보수, 버그관리 등의 사후관리 및 사후지원 책임이 없습니다
- 공개된 코드를 이용하여 새로운 코드, 바이너리, 소프트웨어 등을 개발하고 외부 공개할 때는 개발에 사용한 원본 라이센스파일, 해당 소스코드 파일, 해당 소스코드 개발자의 이름이 반드시 인식 가능하도록 표시되어야 합니다
- 해당 코드를 이용한 기술개발, 기술이전, 교육, 사업화 컨설팅 등의 문의 사항은 KETI 개발자 또는 KETI 기술확산실로 연락 바랍니다
