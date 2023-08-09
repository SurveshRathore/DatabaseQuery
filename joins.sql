SELECT * FROM patients p
inner join province_names pn on pn.province_id = p.province_id
inner join admissions a on a.patient_id = p.patient_id
inner join doctors d on d.doctor_id = a.attending_doctor_id

SELECT p.first_name, p.last_name, a.diagnosis, d.first_name, d.specialty, pn.province_name  FROM patients p
inner join province_names pn on pn.province_id = p.province_id
inner join admissions a on a.patient_id = p.patient_id
inner join doctors d on d.doctor_id = a.attending_doctor_id

SELECT * FROM patients 
inner join province_names on province_names.province_id = patients.province_id
inner join admissions on admissions.patient_id = patients.patient_id
inner join doctors on doctors.doctor_id = admissions.attending_doctor_id

SELECT * FROM patients 
Left join province_names on province_names.province_id = patients.province_id
left join admissions on admissions.patient_id = patients.patient_id
left join doctors on doctors.doctor_id = admissions.attending_doctor_id

SELECT * FROM patients 
Right join province_names on province_names.province_id = patients.province_id
Right join admissions on admissions.patient_id = patients.patient_id
right join doctors on doctors.doctor_id = admissions.attending_doctor_id

SELECT * FROM patients 
cross join province_names on province_names.province_id = patients.province_id
cross join admissions on admissions.patient_id = patients.patient_id
cross join doctors on doctors.doctor_id = admissions.attending_doctor_id
