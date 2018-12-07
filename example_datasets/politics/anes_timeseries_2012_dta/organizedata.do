use anes_timeseries_2012, clear

keep gayrt_marry envir_drill envir_gwarm immig_citizen immig_policy pid_self presvote2012_x inc_incgroup_pre dem_race* dem_hisp* dem_empstatus_1digitfin_x dem_edugroup_x dem_marital dem_age_r_x relig_7cat_x envir_gwhow

replace pid_self=0 if pid_self<0
rename pid_self party
label drop _pid_self
*collapse no preference with indie
replace party=3 if party==0
label define lbl_party 1 "Democrat" 2 "Republican" 3 "Independent" 5 "Other"
label values party lbl_party

replace immig_policy=. if immig_policy<0
rename immig_policy immigpolicy
label drop _immig_policy
label define lbl_immigpolicy 1 "Make immigrants felons and send home" 2 "Guest worker program" 3 "Allow with requirements" 4 "Allow without penalty"
label values immigpolicy lbl_immigpolicy

replace immig_citizen=. if immig_citizen<-8
replace immig_citizen=3 if immig_citizen==-8
recode immig_citizen (3=2) (1=3) (2=1)
rename immig_citizen immigcitizen
label define lbl_favor 1 "Oppose" 2 "Neither/Don't Know" 3 "Favor"
label values immigcitizen lbl_favor

replace envir_drill=. if envir_drill<-8
replace envir_drill=3 if envir_drill==-8
recode envir_drill (3=2) (1=3) (2=1)
rename envir_drill drill
label values drill lbl_favor

generate globalwarm = .
replace globalwarm = 1 if envir_gwarm==1 & (envir_gwhow==1 | envir_gwhow==3)
replace globalwarm = 0 if envir_gwarm==2 | envir_gwhow==2
label define lbl_warm 0 "Not warming from human activity" 1 "Warming from human activity"
label values globalwarm lbl_warm

replace gayrt_marry=. if gayrt_marry<0
rename gayrt_marry gaymarriage
recode gaymarriage (1=3) (3=1)
label drop _gayrt_marry
label define lbl_gaymarriage 1 "No legal recognition" 2 "Civil union" 3 "Support gay marriage"
label values gaymarriage lbl_gaymarriage

replace dem_age_r_x=. if dem_age_r_x<0
label drop _dem_age_r_x
rename dem_age_r_x age

replace dem_marital=1 if dem_marital==2
replace dem_marital=4 if dem_marital==5
replace dem_marital=. if dem_marital<0
rename dem_marital marital
recode marital (6=1) (1=2) (4=3) (3=4)
label define lbl_marital 1 "Never married" 2 "Married" 3 "Divorced/Separated" 4 "Widowed"
label values marital lbl_marital

replace dem_edugroup_x=. if dem_edugroup_x<0
rename dem_edugroup_x educ
label define lbl_educ 1 "Less than HS" 2 "HS graduate" 3 "Some college" 4 "BA degree" 5 "Grad degree"
label values educ lbl_educ

generate workstatus = .
replace workstatus = 1 if dem_empstatus_1digitfin_x==1
replace workstatus = 2 if dem_empstatus_1digitfin_x==2 | dem_empstatus_1digitfin_x==4
replace workstatus =3 if dem_empstatus_1digitfin_x>4 & dem_empstatus_1digitfin_x<=8
label define lbl_workstatus 1 "Working" 2 "Unemployed" 3 "Out of Labor Force"
label values workstatus lbl_workstatus
drop dem_empstatus_1digitfin_x

rename relig_7cat_x relig
replace relig=. if relig<0
*collapse evangs and undiffs
replace relig=2 if relig==5
*collapse black protestant and mainline
replace relig=1 if relig==3
label define lbl_relig 1 "Mainline Protestant" 2 "Evangelical/Undifferentiated Protestant" 4 "Roman Catholic" 6 "Jewish" 7 "Other Religion" 8 "Not Religious"
label values relig lbl_relig

*race/ethnicity is really complicated - I will just use a sequential one dropping
*for simplicity
generate race = .
replace race = 6 if dem_racecps_othrace==1
replace race = 5 if dem_racecps_native==1
replace race = 1 if dem_racecps_white==1
replace race = 4 if dem_racecps_asian==1 | dem_racecps_pacif==1
replace race = 2 if dem_racecps_black==1
replace race = 3 if dem_hisp==1
label define lbl_race 1 "White" 2 "Black" 3 "Hispanic" 4 "Asian/Pacific Islander" 5 "American Indian" 6 "Other"
label values race lbl_race
drop dem_race* dem_hisp*

replace presvote2012_x=. if presvote2012_x<-2
rename presvote2012_x prezvote 
recode prezvote (-2=4) (5=3)
label define lbl_prezvote 1 "Obama" 2 "Romney" 3 "Third party" 4 "Did not vote" 
label values prezvote lbl_prezvote

**use midpoints for income distribution
generate income=. 
replace income=2500 if inc_incgroup_pre==1
replace income=7500 if inc_incgroup_pre==2
replace income=11250 if inc_incgroup_pre==3
replace income=13750 if inc_incgroup_pre==4
replace income=16250 if inc_incgroup_pre==5
replace income=18750 if inc_incgroup_pre==6
replace income=21250 if inc_incgroup_pre==7
replace income=23750 if inc_incgroup_pre==8
replace income=26250 if inc_incgroup_pre==9
replace income=28750 if inc_incgroup_pre==10
replace income=32500 if inc_incgroup_pre==11
replace income=27500 if inc_incgroup_pre==12
replace income=42500 if inc_incgroup_pre==13
replace income=47500 if inc_incgroup_pre==14
replace income=52500 if inc_incgroup_pre==15
replace income=57500 if inc_incgroup_pre==16
replace income=62500 if inc_incgroup_pre==17
replace income=67500 if inc_incgroup_pre==18
replace income=72500 if inc_incgroup_pre==19
replace income=77500 if inc_incgroup_pre==20
replace income=85000 if inc_incgroup_pre==21
replace income=95000 if inc_incgroup_pre==22
replace income=105000 if inc_incgroup_pre==23
replace income=117500 if inc_incgroup_pre==24
replace income=137500 if inc_incgroup_pre==25
replace income=162500 if inc_incgroup_pre==26
replace income=212500 if inc_incgroup_pre==27
replace income=250000 if inc_incgroup_pre==28
drop inc_incgroup_pre

keep party immigcitizen gaymarriage globalwarm age race educ income workstatus relig

saveold politics.dta, replace version(12)
