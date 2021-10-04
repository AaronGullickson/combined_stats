#delimit ;

   infix
      year     1 - 20
      relig    21 - 40
      denom    41 - 60
      fund     61 - 80
      sprel    81 - 100
      spden    101 - 120
      spfund   121 - 140
      hapmar   141 - 160
      marnum   161 - 180
      spmarnum 181 - 200
      ballot   201 - 220
      region   221 - 240
      race     241 - 260
      spdeg    261 - 280
      id_      281 - 300
      wrkstat  301 - 320
      marital  321 - 340
      agewed   341 - 360
      spwrksta 361 - 380
      childs   381 - 400
      age      401 - 420
      educ     421 - 440
      speduc   441 - 460
      degree   461 - 480
      income16 481 - 500
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable relig    "Rs religious preference";
label variable denom    "Specific denomination";
label variable fund     "How fundamentalist is r currently";
label variable sprel    "Spouses religious preference";
label variable spden    "Specific denomination, spouse";
label variable spfund   "How fundamentalist is spouse currently";
label variable hapmar   "Happiness of marriage";
label variable marnum   "R married more than once?";
label variable spmarnum "Has current spouse been married before?";
label variable ballot   "Ballot used for interview";
label variable region   "Region of interview";
label variable race     "Race of respondent";
label variable spdeg    "Spouses highest degree";
label variable id_      "Respondent id number";
label variable wrkstat  "Labor force status";
label variable marital  "Marital status";
label variable agewed   "Age when first married";
label variable spwrksta "Spouse labor force status";
label variable childs   "Number of children";
label variable age      "Age of respondent";
label variable educ     "Highest year of school completed";
label variable speduc   "Highest year school completed, spouse";
label variable degree   "Rs highest degree";
label variable income16 "Total family income";


label define gsp001x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp002x
   99       "No answer"
   98       "Don't know"
   70       "No denomination"
   60       "Other"
   50       "Episcopal"
   48       "Presbyterian-dk wh"
   43       "Presbyterian, merged"
   42       "Other presbyterian"
   41       "United pres ch in us"
   40       "Presbyterian c in us"
   38       "Lutheran-dk which"
   35       "Evangelical luth"
   34       "Other lutheran"
   33       "Wi evan luth synod"
   32       "Lutheran-mo synod"
   31       "Luth ch in america"
   30       "Am lutheran"
   28       "Methodist-dk which"
   23       "Other methodist"
   22       "United methodist"
   21       "Afr meth ep zion"
   20       "Afr meth episcopal"
   18       "Baptist-dk which"
   15       "Other baptists"
   14       "Southern baptist"
   13       "Nat bapt conv usa"
   12       "Nat bapt conv of am"
   11       "Am bapt ch in usa"
   10       "Am baptist asso"
   0        "Not applicable"
;
label define gsp003x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;
label define gsp004x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp005x
   99       "No answer"
   98       "Don't know"
   70       "No denomination"
   60       "Other"
   50       "Episcopal"
   48       "Presbyterian-dk wh"
   43       "Presbyterian, merged"
   42       "Other presbyterian"
   41       "United pres ch in us"
   40       "Presbyterian c in us"
   38       "Lutheran-dk which"
   35       "Evangelical luth"
   34       "Other lutheran"
   33       "Wi evan luth synod"
   32       "Lutheran-mo synod"
   31       "Luth ch in america"
   30       "Am lutheran"
   28       "Methodist-dk which"
   23       "Other methodist"
   22       "United methodist"
   21       "Afr meth ep zion"
   20       "Afr meth episcopal"
   18       "Baptist-dk which"
   15       "Other baptists"
   14       "Southern baptist"
   13       "Nat bapt conv usa"
   12       "Nat bapt conv of am"
   11       "Am bapt ch in usa"
   10       "Am baptist asso"
   0        "Not applicable"
;
label define gsp006x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;
label define gsp007x
   9        "No answer"
   8        "Don't know"
   3        "Not too happy"
   2        "Pretty happy"
   1        "Very happy"
   0        "Not applicable"
;
label define gsp008x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp009x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp010x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp011x
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
label define gsp012x
   3        "Other"
   2        "Black"
   1        "White"
   0        "Not applicable"
;
label define gsp013x
   9        "No answer"
   8        "Don't know"
   7        "Not applicable"
   4        "Graduate"
   3        "Bachelor"
   2        "Junior college"
   1        "High school"
   0        "Lt high school"
;
label define gsp014x
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
label define gsp015x
   9        "No answer"
   5        "Never married"
   4        "Separated"
   3        "Divorced"
   2        "Widowed"
   1        "Married"
;
label define gsp016x
   99       "No answer"
   98       "Don't know"
   0        "Not applicable"
;
label define gsp017x
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
label define gsp018x
   9        "Dk na"
   8        "Eight or more"
;
label define gsp019x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp020x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp021x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp022x
   9        "No answer"
   8        "Don't know"
   7        "Not applicable"
   4        "Graduate"
   3        "Bachelor"
   2        "Junior college"
   1        "High school"
   0        "Lt high school"
;
label define gsp023x
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


label values relig    gsp001x;
label values denom    gsp002x;
label values fund     gsp003x;
label values sprel    gsp004x;
label values spden    gsp005x;
label values spfund   gsp006x;
label values hapmar   gsp007x;
label values marnum   gsp008x;
label values spmarnum gsp009x;
label values ballot   gsp010x;
label values region   gsp011x;
label values race     gsp012x;
label values spdeg    gsp013x;
label values wrkstat  gsp014x;
label values marital  gsp015x;
label values agewed   gsp016x;
label values spwrksta gsp017x;
label values childs   gsp018x;
label values age      gsp019x;
label values educ     gsp020x;
label values speduc   gsp021x;
label values degree   gsp022x;
label values income16 gsp023x;


