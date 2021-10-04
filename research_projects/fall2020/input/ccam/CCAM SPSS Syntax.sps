* Encoding: UTF-8.
******DATA RELEASE SYNTAX********


***RISK PERCEPTIONS***

RECODE worry (-1=-1) (1=1) (2=1) (3=2) (4=2) INTO worry_r.
EXECUTE.

VARIABLE LABELS
worry_r '(RECODED) How worried are you about global warming?'.

VALUE LABELS
worry_r
-1 'Refused'
1 'Not at all/not very worried'
2 'Somewhat/very worried'.
EXECUTE.

RECODE harm_personally harm_US harm_dev_countries harm_future_gen harm_plants_animals (-1=-1) (0=0) (1=1) (2=1) (3=2) (4=2) INTO
harm_personally_r harm_US_r harm_dev_countries_r harm_future_gen_r harm_plants_animals_r.
EXECUTE.

VARIABLE LABELS
harm_personally_r '(RECODED) How much do you think global warming will harm you personally?'
harm_US_r '(RECODED) How much do you think global warming will harm people in the United States?'
harm_dev_countries_r '(RECODED) How much do you think global warming will harm people in developing countries?'
harm_future_gen_r '(RECODED) How much do you think global warming will harm future generations of people?'
harm_plants_animals_r '(RECODED) How much do you think global warming will harm plant and animal species?'.

VALUE LABELS
harm_personally_r harm_US_r harm_dev_countries_r harm_future_gen_r harm_plants_animals_r
-1 'Refused'
0 'Dont know'
1 'Not at all/only a little'
2 'A moderate amount/a great deal'.
EXECUTE.

RECODE when_harm_US (-1=-1) (1=1) (2=1) (3=1) (4=1) (5=2) (6=2) INTO
when_harm_US_r.
EXECUTE.

VARIABLE LABELS
when_harm_US_r '(RECODED) When do you think global warming will start to harm people in the United States?'.

VALUE LABELS
when_harm_US_r
-1 'Refused'
1 'Never/in 25 years or more'
2 'In 10 years/right now'.
EXECUTE.

***POLICY PREFERENCES***

RECODE reg_CO2_pollutant reg_utilities fund_research reg_coal_emissions (-1=-1) (1=1) (2=1) (3=2) (4=2) INTO
reg_CO2_pollutant_r reg_utilities_r fund_research_r reg_coal_emissions_r.
EXECUTE.

VARIABLE LABELS
reg_CO2_pollutant_r '(RECODED) Regulate carbon dioxide (the primary greenhouse gas) as a pollutant'
reg_utilities_r '(RECODED) Require electric utilities to produce at least 20% of their electricity from wind, solar, or other renewable energy sources, even if it costs the average household an extra $100 a year'
fund_research_r '(RECODED) Fund more research into renewable energy sources, such as solar and wind power'
reg_coal_emissions_r '(RECODED) Set strict carbon dioxide emission limits on existing coal-fired power plants to reduce global warming and improve public health...'.

VALUE LABELS
reg_CO2_pollutant_r reg_utilities_r fund_research_r reg_coal_emissions_r
-1 'Refused'
1 'Somewhat/strongly oppose'
2 'Somewhat/strongly support'.
EXECUTE.

***BEHAVIORS***

RECODE discuss_GW (-1=-1) (1=1) (2=1) (3=2) (4=2) INTO discuss_GW_r.
EXECUTE.

VARIABLE LABELS
discuss_GW_r '(RECODED) How often do you discuss global warming with your family and friends?'.

VALUE LABELS
discuss_GW_r
-1 'Refused'
1 'Never/rarely'
2 'Occasionally/often'.
EXECUTE.
