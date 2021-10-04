PROC FORMAT;

  VALUE GSP001X
    9        = "Dk,na"
    8        = "More thn once wk"
    7        = "Every week"
    6        = "Nrly every week"
    5        = "2-3x a month"
    4        = "Once a month"
    3        = "Sevrl times a yr"
    2        = "Once a year"
    1        = "Lt once a year"
    0        = "Never"
  ;
  VALUE GSP002X
    9        = "Pacific"
    8        = "Mountain"
    7        = "W. sou. central"
    6        = "E. sou. central"
    5        = "South atlantic"
    4        = "W. nor. central"
    3        = "E. nor. central"
    2        = "Middle atlantic"
    1        = "New england"
    0        = "Not assigned"
  ;
  VALUE GSP003X
    99       = "No answer"
    98       = "Don't know"
  ;
  VALUE GSP004X
    3        = "Other"
    2        = "Black"
    1        = "White"
    0        = "Not applicable"
  ;
  VALUE GSP005X
    2        = "Female"
    1        = "Male"
  ;
  VALUE GSP006X
    99       = "No answer"
    98       = "Don't know"
    89       = "89 or older"
  ;
  VALUE GSP007X
    9        = "Dk na"
    8        = "Eight or more"
  ;
  VALUE GSP008X
    9        = "No answer"
    8        = "Other"
    7        = "Keeping house"
    6        = "School"
    5        = "Retired"
    4        = "Unempl, laid off"
    3        = "Temp not working"
    2        = "Working parttime"
    1        = "Working fulltime"
    0        = "Not applicable"
  ;
  VALUE GSP009X
    99       = "No answer"
    98       = "Don't know"
    27       = "Refused"
    26       = "$170000 or over"
    25       = "$150000 to $169999"
    24       = "$130000 to $149999"
    23       = "$110000 to $129999"
    22       = "$90000 to $109999"
    21       = "$75000 to $89999"
    20       = "$60000 to 74999"
    19       = "$50000 to 59999"
    18       = "$40000 to 49999"
    17       = "$35000 to 39999"
    16       = "$30000 to 34999"
    15       = "$25000 to 29999"
    14       = "$22500 to 24999"
    13       = "$20000 to 22499"
    12       = "$17500 to 19999"
    11       = "$15000 to 17499"
    10       = "$12500 to 14999"
    9        = "$10000 to 12499"
    8        = "$8 000 to 9 999"
    7        = "$7 000 to 7 999"
    6        = "$6 000 to 6 999"
    5        = "$5 000 to 5 999"
    4        = "$4 000 to 4 999"
    3        = "$3 000 to 3 999"
    2        = "$1 000 to 2 999"
    1        = "Under $1 000"
    0        = "Not applicable"
  ;


DATA GSS.GSS;

   LENGTH
      YEAR     20
      ATTEND   20
      REGION   20
      HOMPOP   20
      RACE     20
      SEX      20
      AGE      20
      CHILDS   20
      WRKSTAT  20
      INCOME16 20   ;

   LABEL
      YEAR     ="Gss year for this respondent                       "
      ATTEND   ="How often r attends religious services"
      REGION   ="Region of interview"
      HOMPOP   ="Number of persons in household"
      RACE     ="Race of respondent"
      SEX      ="Respondents sex"
      AGE      ="Age of respondent"
      CHILDS   ="Number of children"
      WRKSTAT  ="Labor force status"
      INCOME16 ="Total family income"
   ;

   INPUT
      YEAR     1 - 20
      ATTEND   21 - 40
      REGION   41 - 60
      HOMPOP   61 - 80
      RACE     81 - 100
      SEX      101 - 120
      AGE      121 - 140
      CHILDS   141 - 160
      WRKSTAT  161 - 180
      INCOME16 181 - 200   ;

   FORMAT
      ATTEND   GSP001X.
      REGION   GSP002X.
      HOMPOP   GSP003X.
      RACE     GSP004X.
      SEX      GSP005X.
      AGE      GSP006X.
      CHILDS   GSP007X.
      WRKSTAT  GSP008X.
      INCOME16 GSP009X.   ;

PROC CONTENTS DATA=GSS.GSS;

RUN;
