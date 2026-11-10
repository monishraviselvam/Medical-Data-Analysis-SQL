use project_medical_data_history;

show tables;

describe admissions;

describe patients;

describe province_names;

describe doctors;

select first_name,last_name,gender
from patients
where gender='M';

select first_name,last_name
from patients
where allergies is null;

select first_name
from patients
where first_name like 'C%';

select first_name,last_name 
from patients
where weight between 100 and 120;

update patients
set allergies = 'NKA'
where allergies is null;

select concat(first_name," ",last_name) as full_name
from patients;

select patients.first_name,patients.last_name,province_names.province_name
from patients
left join province_names
on patients.province_id=province_names.province_id;

select count(birth_date) as patient_birth
from patients
where year(birth_date)=2010;

select first_name,last_name,height
from patients
where height=
		( 
			select max(height)
            from patients
		);
        
select *
from patients
where patient_id in (1,45,534,879,1000);

select count(*) as total_admissions
from admissions;

select * 
from admissions
where admission_date=discharge_date;

select count(patient_id) as admission_count
from admissions
where patient_id=579;

select distinct city 
from patients
where province_id='NS';

select first_name,last_name,birth_date
from patients
where height>160 and weight>70;

select distinct year(birth_date) as birth_year
from patients
order by birth_year;

select first_name
from patients
group by first_name
having count(*)=1;

select first_name,patient_id
from patients
where first_name like 's%' and first_name like '%s'
	  and length(First_name)>=6;

select patients.first_name,patients.last_name,patients.patient_id
from patients
inner join admissions
on patients.patient_id=admissions.patient_id
where admissions.diagnosis='Dementia';

select first_name 
from patients
order by length(first_name),first_name;

select count(case when gender='M' then 1 end) as total_male_count,
count(case when gender='F' then 1 end) as total_female_count
from patients;

select count(case when gender='M' then 1 end) as total_male_count,
count(case when gender='F' then 1 end) as total_female_count
from patients;

select patient_id,diagnosis
from admissions
group by patient_id,diagnosis 
having count(*)>1;

select city,count(patient_id) as total_patient_count
from patients
group by city
order by total_patient_count desc,city asc;

select first_name,last_name,'Patient' as role
from patients

union all

select first_name,last_name,'Doctor' as role
from doctors;

select allergies,count(patient_id) as allergy_count
from patients
where allergies is not null
group by allergies
order by allergy_count desc;

select first_name,last_name,birth_date
from patients
where year(birth_date) between 1970 and 1979
order by birth_date asc;

select concat(upper(last_name),",",lower(first_name)) as full_name
from patients
order by first_name desc;

select province_id,sum(height) as patient_height
from patients
group by province_id
having sum(height)>=7000;

select (max(weight)-min(weight)) as weight_difference
from patients
where last_name='Maroni';

select day(admission_date) as day_number,count(admission_date) as admission_count
from admissions
group by day_number
order by admission_count desc;

select (floor(weight / 10) * 10) as weight_group,count(patient_id)
from patients
group by weight_group
order by weight_group desc;

select patient_id,weight,height, 
case when weight / power(height / 100, 2) >= 30 then 1 else 0 end as isObese
from patients;

select patients.patient_id,patients.first_name,patients.last_name,doctors.specialty
from patients
inner join admissions
on patients.patient_id = admissions.patient_id
inner join doctors
on admissions.attending_doctor_id = doctors.doctor_id
where admissions.diagnosis='Epilepsy' and doctors.first_name='Lisa';