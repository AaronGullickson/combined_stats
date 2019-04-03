# Wage Data, 2018

The data here are extracted from [Current Population Survey](https://www.census.gov/programs-surveys/cps.html) data via [IPUMS](https://cps.ipums.org/cps/). I used the earning data from the outgoing rotation groups (ORG) for each month of the CPS. Each household in the CPS is is part of a rolling panel in which they are in for four months, out for eight months, and back in for four months. In the fourth and eight month of inclusion they are given additional questions as part of the outgoing rotation group. This earnings data is generally considered more reliable than the CPS-ASEC data because it does not require recall of annual earnings and hours and weeks worked in the year. Wage employees are asked for their hourly wages directly. The hourly wage of salaried workers is assessed by a question on hours worked in a typical week and earnings in the prior week. 

The raw data are available in the gzipped file `cps_00003.data.gz` and a codebook is available in `cps_00003.cbk.txt`. 

I limited the data only to those individuals between the ages of 18 and 65 in order to capture the age range of the typical worker. The dataset contains the following variables:

- **wages**: The hourly wage for the respondent. For workers who report being paid hourly, this value is based on a direct question that asked for respondents' hourly wages. For individuals in salaried positions, this value was derived by dividing the earnings from the previous week by the hours worked in the previous week. Anyone who reported a wage of less than one dollar is removed. Any wage higher than \$99.99 is top-coded as \$99.99. 
- **age**: age of the respondent in years.
- **gender**: Male or Female.
- **race**: The respondent's racial identification recoded from two separate questions on race and hispanicity into the following categories: White, Black, Latino, Asian, Indigenous, and Other/Multiple races. The indigenous category includes American Indians, Pacific Islanders, and Alaska Natives. 
- **marstat**: The respondent's current marital status: never married, married, divorced or separated, and widowed.
- **education**: The respondent's highest educational attainment: no high school diploma, high school diploma, associate's degree, bachelor's degree, graduate degree. The last category includes master's degrees, professional degrees, and doctoral degrees. 
- **occup**: The broad occupational category of the respondent. In the actual CPS data, there are [hundreds of different occupations listed](https://www.bls.gov/cps/cenocc2010.htm). For our purposes, I have simplified this into a broader (and smaller) set of occupational categories that we will use for the analysis. Here are the categories of the occupational variable, along with some examples of specific occupations:
      - *Managers*: Human resources Managers, Operations Managers
      - *Business/Finance Specialist*: Claims Adjusters, Compliance Officers, Accountants, Tax Preparers
      - *STEM*: Computer Programmers, Civil Engineers, Biological Scientists
      - *Doctors*: Dentists, Surgeons, Optometrists
      - *Legal*: Lawyers, Judges, Paralegals
      - *Education*: Preschool and Kindergarten Teachers, Librarians
      - *Arts, Design, and Media*: Artists, Dancers and Choreographers, Writers and Authors
      - *Other Healthcare*: Registered Nurses, Physical Therapists, Dental Hygienists
      - *Social Services*: Clergy, Social Workers
      - *Service*: Waiters and Waitresses, Barbers, Bartenders
      - *Sales*: Cashier, Telemarketer
      - *Administrative Support*: Bank Tellers, Data Entry Keyers, Receptionist
      - *Manual*: Carpenters, Logging Workers, Mining Machine Operators, Small Engine Mechanic
- **nchild**: Number of own children living in the household with the respondent. 
- **foreign_born**: A variable indicating whether the respondent is foreign born or not. Recorded as "Yes" or "No". 
- **earn_type**: This variable indicates whether the respondent reported being paid hourly wages or by salary. 
- **earningwt**: A technical weighting variable for use with any CPS analysis of earnings. 


