#delimit ;

   infix
      year     1 - 20
      attend   21 - 40
      region   41 - 60
      hompop   61 - 80
      race     81 - 100
      sex      101 - 120
      age      121 - 140
      childs   141 - 160
      wrkstat  161 - 180
      income16 181 - 200
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable attend   "How often r attends religious services";
label variable region   "Region of interview";
label variable hompop   "Number of persons in household";
label variable race     "Race of respondent";
label variable sex      "Respondents sex";
label variable age      "Age of respondent";
label variable childs   "Number of children";
label variable wrkstat  "Labor force status";
label variable income16 "Total family income";


label define gsp001x
   9        "Dk,na"
   8        "More thn once wk"
   7        "Every week"
   6        "Nrly every week"
   5        "2-3x a month"
   4        "Once a month"
   3        "Sevrl times a yr"
   2        "Once a year"
   1        "Lt once a year"
   0        "Never"
;
label define gsp002x
   9        "Pacific"
   8        "Mountain"
   7        "W. sou. central"
   6        "E. sou. central"
   5        "South atlantic"
   4        "W. nor. central"
   3        "E. nor. central"
   2        "Middle atlantic"
   1        "New england"
   0        "Not assigned"
;
label define gsp003x
   99       "No answer"
   98       "Don't know"
;
label define gsp004x
   3        "Other"
   2        "Black"
   1        "White"
   0        "Not applicable"
;
label define gsp005x
   2        "Female"
   1        "Male"
;
label define gsp006x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp007x
   9        "Dk na"
   8        "Eight or more"
;
label define gsp008x
   9        "No answer"
   8        "Other"
   7        "Keeping house"
   6        "School"
   5        "Retired"
   4        "Unempl, laid off"
   3        "Temp not working"
   2        "Working parttime"
   1        "Working fulltime"
   0        "Not applicable"
;
label define gsp009x
   99       "No answer"
   98       "Don't know"
   27       "Refused"
   26       "$170000 or over"
   25       "$150000 to $169999"
   24       "$130000 to $149999"
   23       "$110000 to $129999"
   22       "$90000 to $109999"
   21       "$75000 to $89999"
   20       "$60000 to 74999"
   19       "$50000 to 59999"
   18       "$40000 to 49999"
   17       "$35000 to 39999"
   16       "$30000 to 34999"
   15       "$25000 to 29999"
   14       "$22500 to 24999"
   13       "$20000 to 22499"
   12       "$17500 to 19999"
   11       "$15000 to 17499"
   10       "$12500 to 14999"
   9        "$10000 to 12499"
   8        "$8 000 to 9 999"
   7        "$7 000 to 7 999"
   6        "$6 000 to 6 999"
   5        "$5 000 to 5 999"
   4        "$4 000 to 4 999"
   3        "$3 000 to 3 999"
   2        "$1 000 to 2 999"
   1        "Under $1 000"
   0        "Not applicable"
;


label values attend   gsp001x;
label values region   gsp002x;
label values hompop   gsp003x;
label values race     gsp004x;
label values sex      gsp005x;
label values age      gsp006x;
label values childs   gsp007x;
label values wrkstat  gsp008x;
label values income16 gsp009x;


