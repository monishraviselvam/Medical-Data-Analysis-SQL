use project_medical_data_history;

show tables;

describe admissions;

describe patients;

describe province_names;

describe doctors;

-- Task 01: Retrieve Male Patients' Details
select first_name,last_name,gender
from patients
where gender='M';

-- Task 02: Identify Patients with No Recorded Allergies
select first_name,last_name
from patients
where allergies is null;

-- Task 03: Find Patients Whose First Name Starts with 'C'
select first_name
from patients
where first_name like 'C%';

-- Task 04: Retrieve Patients with Weight Between 100 and 120
select first_name,last_name 
from patients
where weight between 100 and 120;

-- Task 05: Update NULL Allergy Values to 'NKA'
update patients
set allergies = 'NKA'
where allergies is null;

-- Task 06: Display Patients' Full Names Using CONCAT()
select concat(first_name," ",last_name) as full_name
from patients;

-- Task 07: Retrieve Patient Details Along with Province Names Using JOIN
select patients.first_name,patients.last_name,province_names.province_name
from patients
left join province_names
on patients.province_id=province_names.province_id;

-- Task 08: Count Patients Born in the Year 2010
select count(birth_date) as patient_birth
from patients
where year(birth_date)=2010;

-- Task 09: Identify the Tallest Patient
select first_name,last_name,height
from patients
where height=
		( 
			select max(height)
            from patients
		);

-- Task 10: Retrieve Patients Using Specific Patient IDs
select *
from patients
where patient_id in (1,45,534,879,1000);

-- Task 11: Calculate the Total Number of Admissions
select count(*) as total_admissions
from admissions;

-- Task 12: Find Admissions Where Admission and Discharge Dates Are the Same
select * 
from admissions
where admission_date=discharge_date;

-- Task 13: Retrieve All Admissions for Patient ID 579
select count(patient_id) as admission_count
from admissions
where patient_id=579;

-- Task 14: Find Unique Cities in Nova Scotia Province
select distinct city 
from patients
where province_id='NS';

-- Task 15: Retrieve Patients Based on Height and Weight Conditions
select first_name,last_name,birth_date
from patients
where height>160 and weight>70;

-- Task 16: Display Distinct Birth Years in Ascending Order
select distinct year(birth_date) as birth_year
from patients
order by birth_year;

-- Task 17: Identify First Names That Appear Only Once
select first_name
from patients
group by first_name
having count(*)=1;

-- Task 18: Find First Names Starting and Ending with 'S' with at Least 6 Characters
select first_name,patient_id
from patients
where first_name like 's%' and first_name like '%s'
	  and length(first_name)>=6;

-- Task 19: Retrieve Patients Diagnosed with Dementia Using JOIN
select patients.first_name,patients.last_name,patients.patient_id
from patients
inner join admissions
on patients.patient_id=admissions.patient_id
where admissions.diagnosis='Dementia';

-- Task 20: Sort Patients by First Name Length and Alphabetical Order
select first_name 
from patients
order by length(first_name),first_name;

-- Task 21: Count Male and Female Patients in a Single Row
select count(case when gender='M' then 1 end) as total_male_count,
count(case when gender='F' then 1 end) as total_female_count
from patients;

-- Task 22: Calculate Male and Female Patient Counts Using Conditional Aggregation
select count(case when gender='M' then 1 end) as total_male_count,
count(case when gender='F' then 1 end) as total_female_count
from patients;

-- Task 23: Identify Patients with Multiple Admissions for the Same Diagnosis
select patient_id,diagnosis
from admissions
group by patient_id,diagnosis
having count(*)>1;

-- Task 24: Count Patients by City and Sort by Patient Count
select city,count(patient_id) as total_patient_count
from patients
group by city
order by total_patient_count desc,city asc;

-- Task 25: Combine Patient and Doctor Details Using UNION ALL
select first_name,last_name,'Patient' as role
from patients

union all

select first_name,last_name,'Doctor' as role
from doctors;

-- Task 26: Count Patients by Allergy and Exclude NULL Values
select allergies,count(patient_id) as allergy_count
from patients
where allergies is not null
group by allergies
order by allergy_count desc;

-- Task 27: Retrieve Patients Born in the 1970s
select first_name,last_name,birth_date
from patients
where year(birth_date) between 1970 and 1979
order by birth_date asc;

-- Task 28: Format Patient Names Using UPPER(), LOWER(), and CONCAT()
select concat(upper(last_name),",",lower(first_name)) as full_name
from patients
order by first_name desc;

-- Task 29: Identify Provinces with a Total Patient Height of at Least 7000
select province_id,sum(height) as patient_height
from patients
group by province_id
having sum(height)>=7000;

-- Task 30: Calculate the Weight Difference Between Maximum and Minimum Weight for Maroni
select (max(weight)-min(weight)) as weight_difference
from patients
where last_name='Maroni';

-- Task 31: Count Admissions by Day of the Month
select day(admission_date) as day_number,count(admission_date) as admission_count
from admissions
group by day_number
order by admission_count desc;

-- Task 32: Group Patients into Weight Ranges
select (floor(weight / 10) * 10) as weight_group,count(patient_id) as patient_weight
from patients
group by weight_group
order by weight_group desc;

-- Task 33: Calculate BMI and Identify Obese Patients
select patient_id,weight,height,
case when weight / power(height / 100, 2) >= 30 then 1 else 0 end as isObese
from patients;

-- Task 34: Retrieve Epilepsy Patients Attended by Doctor Lisa
select patients.patient_id,patients.first_name,patients.last_name,doctors.specialty
from patients
inner join admissions
on patients.patient_id = admissions.patient_id
inner join doctors
on admissions.attending_doctor_id = doctors.doctor_id
where admissions.diagnosis='Epilepsy' and doctors.first_name='Lisa';