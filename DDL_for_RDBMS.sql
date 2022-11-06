

Q.4. 

DDL for RDBMS 

 

/*creating manager-staff table*/ 

CREATE TABLE manager_staff 

(managerid VARCHAR2(4) NOT NULL, 

fname VARCHAR2(15), 

lname VARCHAR2(15), 

title VARCHAR2(4), 

basic_salary VARCHAR2(15), 

over_time_rate VARCHAR2(15), 

Primary Key (managerid) 

); 

 

/*creating van table*/ 

CREATE TABLE van 

(vehicle_number VARCHAR2(10) NOT NULL, 

model VARCHAR2(15), 

year NUMBER(4), 

purchase_date DATE, 

PRIMARY KEY (vehicle_number) 

); 

 

 

/*creating driver-staff table*/ 

CREATE TABLE driver 

(driverid VARCHAR2(4) NOT NULL, 

fname VARCHAR2(15), 

lname VARCHAR2(15), 

title VARCHAR2(4), 

address1 VARCHAR2(10), 

address2 VARCHAR2(10), 

address3 VARCHAR2(10), 

office_contact NUMBER(10), 

join_date DATE, 

driver_salary VARCHAR2(15), 

fuel_allowance VARCHAR2(15), 

vehicle_rental VARCHAR2(4), 

vehicle_number VARCHAR2(10), 

jobid VARCHAR2(4), 

job_descr VARCHAR2(4), 

job_responsibility VARCHAR2(15), 

Primary Key (driverid), 

Foreign Key (vehicle_number) references van(vehicle_number) 

); 

 

/*creating eng-staff table*/ 

CREATE TABLE sound_eng 

(engid VARCHAR2(4) NOT NULL, 

fname VARCHAR2(15), 

lname VARCHAR2(15), 

title VARCHAR2(4), 

address1 VARCHAR2(10), 

address2 VARCHAR2(10), 

address3 VARCHAR2(10), 

office_contact NUMBER(10), 

join_date DATE, 

eng_salary VARCHAR2(15), 

over_time_rate VARCHAR2(15), 

maintenance_allowance VARCHAR2(4), 

jobid VARCHAR2(4), 

job_descr VARCHAR2(4), 

job_responsibility VARCHAR2(15), 

Primary Key (engid) 

); 

 

/*creating studio_branch table*/ 

CREATE TABLE studio_branch 

(branchid VARCHAR2(4) NOT NULL, 

branch_name VARCHAR2(10), 

location_name VARCHAR(10), 

adress1 VARCHAR(10), 

adress2 VARCHAR(10), 

adress3 VARCHAR(10), 

tel_no NUMBER(10), 

managerid VARCHAR(4), 

Primary Key (branchid), 

Foreign Key (managerid) references manager_staff(managerid) 

); 

 

 

/*creating staffworks in studion branches table*/ 

CREATE TABLE manager_work_studio 

(branchid VARCHAR2(4)NOT NULL, 

managerid  VARCHAR2(4), 

assign_date DATE, 

end_date DATE, 

Primary Key (branchid,managerid,assign_date), 

Foreign Key (branchid) references studio_branch(branchid), 

Foreign Key (managerid) references manager_staff(managerid) 

); 

 

 

CREATE TABLE driver_work_studio 

(branchid VARCHAR2(4)NOT NULL, 

driverid VARCHAR2(4) , 

assign_date DATE, 

end_date DATE, 

Primary Key (branchid,driverid,assign_date), 

Foreign Key (branchid) references studio_branch(branchid), 

Foreign Key (driverid) references driver(driverid) 

); 

 

/*creating staff_work_studio table*/ 

CREATE TABLE eng_work_studio 

(branchid VARCHAR2(4)NOT NULL, 

engid VARCHAR2(4), 

assign_date DATE, 

end_date DATE, 

Primary Key (branchid,engid,assign_date), 

Foreign Key (branchid) references studio_branch(branchid), 

Foreign Key (engid) references sound_eng(engid) 

); 

 

/*creating portable_equipment table*/ 

CREATE TABLE portable_equipment 

(equipment_id VARCHAR2(4)NOT NULL, 

category_name VARCHAR(10), 

model VARCHAR2(10), 

purchase_date DATE, 

responsible_staff_id VARCHAR(4), 

Primary Key (equipment_id), 

Foreign Key (responsible_staff_id) references sound_eng(engid) 

); 

 

/*creating fixed_equipment table*/ 

CREATE TABLE fixed_equipment 

(equipment_id VARCHAR2(4)NOT NULL, 

category_name VARCHAR(10), 

model VARCHAR2(10), 

purchase_date DATE, 

responsible_staff_id VARCHAR(4), 

Primary Key (equipment_id), 

Foreign Key (responsible_staff_id) references sound_eng(engid) 

); 

 

/*creating equipment_maintanance table*/ 

CREATE TABLE portable_equipment_maintanance 

(portable_equipment_id VARCHAR2(4), 

engid VARCHAR2(4), 

maintanance_interval VARCHAR2(10), 

maintance_month VARCHAR2(10), 

maintance_day NUMBER(2), 

Primary Key (portable_equipment_id,engid), 

Foreign Key (portable_equipment_id) references portable_equipment(equipment_id), 

Foreign Key (engid) references sound_eng(engid) 

); 

 

 

/*creating equipment_maintanance table*/ 

CREATE TABLE fixed_equipment_maintanance ( 

fixed_equipment_id VARCHAR2(4), 

engid VARCHAR2(4), 

maintanance_interval VARCHAR2(10), 

maintance_month VARCHAR2(10), 

maintance_day NUMBER(2), 

Primary Key (fixed_equipment_id,engid), 

Foreign Key (fixed_equipment_id) references fixed_equipment(equipment_id), 

Foreign Key (engid) references sound_eng(engid) 

); 

 

 

/*creating equipment_repairing table*/ 

CREATE TABLE portable_equipment_repaire 

(repaire_id VARCHAR2(4) NOT NULL, 

portable_equipment_id VARCHAR2(4), 

engid VARCHAR2(4), 

damage_date DATE, 

repaire_date DATE, 

cost_of_repaire NUMBER(10), 

Primary Key (repaire_id,portable_equipment_id,engid), 

Foreign Key (portable_equipment_id) references portable_equipment(equipment_id), 

Foreign Key (engid) references sound_eng(engid) 

); 

 

/*creating equipment_repairing table*/ 

CREATE TABLE fixed_equipment_repaire 

(repaire_id VARCHAR2(4) NOT NULL, 

fixed_equipment_id VARCHAR2(4), 

engid VARCHAR2(4), 

damage_date DATE, 

repaire_date DATE, 

cost_of_repaire NUMBER(10), 

Primary Key (repaire_id,fixed_equipment_id,engid), 

Foreign Key (fixed_equipment_id) references fixed_equipment(equipment_id), 

Foreign Key (engid) references sound_eng(engid) 

); 

 

 

CREATE TABLE port_equipment_transport 

(portable_equipment_id VARCHAR2(4), 

driverid VARCHAR2(4), 

gate_pass_id VARCHAR2(4), 

transport_date DATE, 

start_location VARCHAR2(30), 

delivery_location VARCHAR2(30), 

Primary Key (portable_equipment_id,driverid,gate_pass_id), 

Foreign Key (portable_equipment_id) references portable_equipment(equipment_id), 

Foreign Key (driverid) references driver(driverid) 

); 

 

/*creating project_type table*/ 

CREATE TABLE project_type 

(project_type_id VARCHAR2(4) NOT NULL, 

project_type_descr VARCHAR2(10), 

Primary Key (project_type_id)); 

 

 

/*creating customer table*/ 

CREATE TABLE cutomer 

(cusid VARCHAR2(10) NOT NULL, 

fname VARCHAR2(15), 

lname VARCHAR2(15), 

title VARCHAR2(4), 

gender VARCHAR(4), 

address1 VARCHAR(10), 

address2 VARCHAR(10), 

address3 VARCHAR(10), 

sound_eng_id VARCHAR2(4), 

Primary Key (cusid) , 

Foreign Key (sound_eng_id ) references sound_eng(engid) 

); 

 

 

/*creating portable_order_request table*/ 

/*DROP TABLE poratable_order_request*/ 

CREATE TABLE poratable_order_request 

(portable_reqid VARCHAR2(4)NOT NULL UNIQUE, 

request_date DATE, 

start_date DATe, 

end_date DATE, 

portable_equipment_id VARCHAR2(4), 

cusid VARCHAR2(10), 

cutomer_expertise_level VARCHAR2(10), 

project_type_id VARCHAR2(4), 

Primary Key (portable_reqid,portable_equipment_id,cusid,project_type_id), 

Foreign Key (portable_equipment_id) references portable_equipment(equipment_id), 

Foreign Key (cusid) references cutomer(cusid), 

Foreign Key (project_type_id) references project_type(project_type_id)); 

 

 

/*creating fixed_order_request table*/ 

/*DROP TABLE fixed_order_request*/ 

CREATE TABLE fixed_order_request 

(fixed_reqid VARCHAR2(4) NOT NULL UNIQUE, 

request_date DATE, 

start_date DATe, 

end_date DATE, 

fixed_equipment_id VARCHAR2(4), 

cusid VARCHAR2(10), 

cutomer_expertise_level VARCHAR2(10), 

project_type_id VARCHAR2(4), 

Primary Key (fixed_reqid,fixed_equipment_id,cusid,project_type_id), 

Foreign Key (fixed_equipment_id) references fixed_equipment(equipment_id), 

Foreign Key (cusid) references cutomer(cusid), 

Foreign Key (project_type_id) references project_type(project_type_id)); 

 

/*creating portabal_hiring_agreement table*/ 

CREATE TABLE portable_hiring_agreement  

(portable_hiring_agreement_id VARCHAR2(4) NOT NULL, 

hiring_date DATE, 

return_date DATE, 

initial_cost NUMBER, 

additinal_insurance NUMBER, 

PRIMARY KEY (portable_hiring_agreement_id)); 

 

/*creating fixed_hiring_agreement table*/ 

CREATE TABLE fixed_hiring_agreement  

(fixed_hiring_agreement_id VARCHAR2(4) NOT NULL, 

hiring_date DATE, 

return_date DATE, 

total_hours NUMBER, 

hourly_rate NUMBER, 

sound_eng_id VARCHAR2(4), 

PRIMARY KEY (fixed_hiring_agreement_id), 

Foreign Key (sound_eng_id) references sound_eng(engid) 

); 

 

/*creating portable_order_approval table*/ 

CREATE TABLE poratable_order_approval  

(portable_reqid VARCHAR2(4), 

sound_eng_id VARCHAR2(4), 

portable_hiring_agreement_id VARCHAR2(4), 

equipment_availability VARCHAR2(4), 

approval_status VARCHAR2(4), 

PRIMARY KEY (portable_reqid,sound_eng_id,portable_hiring_agreement_id), 

Foreign Key (portable_reqid) references poratable_order_request(portable_reqid), 

Foreign Key (sound_eng_id) references sound_eng(engid), 

Foreign Key (portable_hiring_agreement_id) references portable_hiring_agreement(portable_hiring_agreement_id) 

); 

 

  

 

/*creating fixed_order_approval table*/ 

CREATE TABLE fixed_order_approval  

(fixed_reqid VARCHAR2(4)NOT NULL, 

sound_eng_id VARCHAR2(4), 

fixed_hiring_agreement_id VARCHAR2(4), 

equipment_availability VARCHAR2(4), 

approval_states VARCHAR2(4), 

PRIMARY KEY (fixed_reqid,sound_eng_id,fixed_hiring_agreement_id), 

Foreign Key (fixed_reqid) references fixed_order_request(fixed_reqid), 

Foreign Key (sound_eng_id) references sound_eng(engid), 

Foreign Key (fixed_hiring_agreement_id) references fixed_hiring_agreement(fixed_hiring_agreement_id) 

); 

 

 

CREATE TABLE fixed_eqp_hiring_to_customer  

(fixed_hiring_agreement_id VARCHAR2(4), 

fixed_equipment_id VARCHAR2(4), 

cusid VARCHAR2(4), 

PRIMARY KEY (fixed_hiring_agreement_id ,fixed_equipment_id,cusid), 

Foreign Key (fixed_equipment_id) references fixed_equipment(equipment_id), 

Foreign Key (fixed_hiring_agreement_id) references fixed_hiring_agreement(fixed_hiring_agreement_id), 

Foreign Key (cusid) references cutomer(cusid) 

); 

 

CREATE TABLE port_eqp_hiring_to_customer  

(portable_hiring_agreement_id VARCHAR2(4)NOT NULL, 

portable_equipment_id VARCHAR2(4), 

cusid VARCHAR2(4), 

PRIMARY KEY (portable_hiring_agreement_id,portable_equipment_id,cusid), 

Foreign Key (portable_equipment_id) references portable_equipment(equipment_id), 

Foreign Key (portable_hiring_agreement_id) references portable_hiring_agreement(portable_hiring_agreement_id), 

Foreign Key (cusid) references cutomer(cusid) 

); 

 

 
