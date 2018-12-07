clear
use "General Social Survey, 2004.DTA"

drop if sexfreq==. | sexfreq>6
drop if educ==99
drop if age==99
drop if relig==99



//code into times per year
gen sexf=0
replace sexf=1.5 if sexfreq==1
replace sexf=12 if sexfreq==2
replace sexf=30 if sexfreq==3
replace sexf=52 if sexfreq==4
replace sexf=130 if sexfreq==5
replace sexf=156 if sexfreq==6

generate relig2=.
replace relig2=2 if relig==1
replace relig2=1 if fund==1
replace relig2=3 if relig==2
replace relig2=4 if relig==3
replace relig2=5 if relig>4
replace relig2=6 if relig==4
label define lbl_relig 1 "Fund Protestant" 2 "Mainline Protestant" 3 "Catholic" 4 "Jewish" 5 "Other" 6 "None"
label values relig2 lbl_relig
drop relig
rename relig2 relig

rename sex gender
keep sexfreq sexf age gender educ marital relig
saveold sexfreq, replace version(12)

generate married = marital==1
generate female = sex==2
generate college = educ>=16
replace age = age-30
replace educ = educ-12
gen age2 = age^2

regress sexf married
regress sexf female
regress sexf educ
regress sexf college
regress sexf age

regress sexf married female educ age
regress sexf married female college age

xi: regress sexf married female i.college*age

xi: regress sexf married i.female*i.college age

xi: regress sexf i.married*age female college
