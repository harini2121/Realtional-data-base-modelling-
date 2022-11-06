
Q4. DDL for ORDBMS 

 

/* Address*/ 

CREATE TYPE Staff_Address_objtyp AS OBJECT ( 

  Street         VARCHAR2(200), 

  City           VARCHAR2(200), 

  State          CHAR(2), 

  Zip            VARCHAR2(20) 

  ) ; 

/ 

 

 

 

/* Person Name*/ 

CREATE TYPE person_name_objtyp AS OBJECT ( 

  title         VARCHAR2(3), 

  fname         VARCHAR2(20), 

  lanme          VARCHAR2(20) 

  ) ; 

/ 

 

 

/*PhoneList*/ 

CREATE TYPE phoneList_vartyp AS VARRAY(10) OF VARCHAR2(20); 

/ 

 

 

/*creating manager-staff table*/ 

CREATE TYPE manager_staff_objtyp AS OBJECT  

(managerid VARCHAR2(4), 

manager_name REF person_name_objtyp, 

Address_obj  Staff_Address_objtyp, 

phoneList    phoneList_vartyp, 

gender VARCHAR2(4), 

office_contact NUMBER(10), 

join_date DATE, 

basic_salary VARCHAR2(15), 

over_time_rate VARCHAR2(15), 

incentive_rate VARCHAR2(4), 

jobid VARCHAR2(4), 

job_descr VARCHAR2(4), 

job_responsibility VARCHAR2(15) 

); 

/ 

 

CREATE TABLE manager_staff OF manager_staff_objtyp (managerid PRIMARY KEY) 

   OBJECT IDENTIFIER IS PRIMARY KEY; 

 

 

 

/*creating van table*/ 

CREATE TYPE van_objtyp AS OBJECT  

(vehicle_number VARCHAR2(10), 

model VARCHAR2(15), 

year NUMBER(4), 

purchase_date DATE 

) NOT FINAL ; 

/ 

 

CREATE TYPE vehicle_tbl AS TABLE OF van_objtyp (vehicle_number PRIMARY KEY) 

   OBJECT IDENTIFIER IS PRIMARY KEY; 

 

 

 

/*creating driver-staff table*/ 

CREATE TYPE driver_objtyp AS OBJECT 

(driverid VARCHAR2(4), 

driver_name REF person_name_objtyp, 

Address_obj  REF Staff_Address_objtyp, 

office_contact NUMBER(10), 

join_date DATE, 

driver_salary VARCHAR2(15), 

fuel_allowance VARCHAR2(15), 

vehicle_rental VARCHAR2(4), 

vehicle_number REF  van_objtyp, 

jobid VARCHAR2(4), 

job_descr VARCHAR2(4), 

job_responsibility VARCHAR2(15) 

); 

/ 

 

CREATE TABLE driver OF driver_objtyp (  

   PRIMARY KEY (driverid) 

   FOREIGN KEY (vehicle_number) REFERENCES van_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

 

/*creating eng-staff table*/ 

CREATE TYPE sound_eng_objtyp AS OBJECT 

(engid VARCHAR2(4), 

eng_name REF person_name_objtyp, 

Address_obj REF Staff_Address_objtyp, 

office_contact NUMBER(10), 

join_date DATE, 

eng_salary VARCHAR2(15), 

over_time_rate VARCHAR2(15), 

maintenance_allowance VARCHAR2(4), 

jobid VARCHAR2(4), 

job_descr VARCHAR2(4), 

job_responsibility VARCHAR2(15) 

); 

/ 

 

CREATE TABLE sound_eng OF sound_eng_objtyp (engid PRIMARY KEY) 

   OBJECT IDENTIFIER IS PRIMARY KEY; 

    

 

/*creating studio_branch table*/ 

CREATE TYPE studio_branch_objtyp AS OBJECT 

(branchid VARCHAR2(4), 

branch_name VARCHAR2(10), 

location_name VARCHAR(10), 

tel_no NUMBER(10), 

managerid REF manager_staff_objtyp 

); 

/ 

 

CREATE TYPE studio_branch AS TABLE OF studio_branch_objtyp (branchid PRIMARY KEY) 

   OBJECT IDENTIFIER IS PRIMARY KEY; 

 

 

 

CREATE TYPE manager_work_studio_objtyp AS OBJECT 

(branchid  REF studio_branch_objtyp, 

managerid  REF manager_staff_objtyp, 

assign_date DATE, 

end_date DATE 

); 

/ 

 

 

CREATE TABLE manager_work_studio OF manager_work_studio_objtyp (  

   PRIMARY KEY (branchid,managerid) 

   FOREIGN KEY (branchid ) REFERENCES studio_branch_objtyp 

   FOREIGN KEY (managerid) REFERENCES manager_staff_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/   

    

 

CREATE TYPE driver_work_studio_objtyp AS OBJECT 

(branchid REF studio_branch_objtyp, 

driverid REF driver_objtyp , 

assign_date DATE, 

end_date DATE 

); 

/ 

 

 

CREATE TABLE driver_work_studio OF driver_work_studio_objtyp (  

   PRIMARY KEY (branchid,driverid) 

   FOREIGN KEY (branchid ) REFERENCES studio_branch_objtyp 

   FOREIGN KEY (driverid) REFERENCES driver_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/   

 

/*creating staff_work_studio table*/ 

CREATE TYPE eng_work_studio_objtyp AS OBJECT 

(branchid REF studio_branch_objtyp, 

engid REF sound_eng_objtyp, 

assign_date DATE, 

end_date DATE 

); 

/ 

 

CREATE TABLE eng_work_studio OF eng_work_studio_objtyp (  

   PRIMARY KEY (branchid,engid) 

   FOREIGN KEY (branchid ) REFERENCES studio_branch_objtyp 

   FOREIGN KEY (engid) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/   

 

 

 

 

/*creating portable_equipment table*/ 

CREATE TYPE portable_equipment_objtyp AS OBJECT 

(equipment_id VARCHAR2(4), 

category_name VARCHAR(10), 

model VARCHAR2(10), 

purchase_date DATE, 

responsible_staff_id REF sound_eng_objtyp 

); 

/ 

 

 

CREATE TABLE portable_equipment OF portable_equipment_objtyp (  

   PRIMARY KEY (equipment_id) 

   FOREIGN KEY (responsible_staff_id) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

/*creating fixed_equipment table*/ 

CREATE TYPE fixed_equipment_objtyp AS OBJECT 

(equipment_id VARCHAR2(4), 

category_name VARCHAR(10), 

model VARCHAR2(10), 

purchase_date DATE, 

responsible_staff_id REF sound_eng_objtyp 

); 

/ 

 

CREATE TABLE fixed_equipment OF fixed_equipment_objtyp (  

   PRIMARY KEY (equipment_id) 

   FOREIGN KEY (responsible_staff_id) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

/*creating equipment_maintanance table*/ 

CREATE TYPE portable_eqp_maint_objtyp AS OBJECT 

(portable_equipment_id REF portable_equipment_objtyp, 

engid REF sound_eng_objtyp, 

maintanance_interval VARCHAR2(10), 

maintance_month VARCHAR2(10), 

maintance_day NUMBER(2) 

); 

/ 

 

CREATE TABLE portable_eqp_maint OF portable_eqp_maint_objtyp (  

   PRIMARY KEY (portable_equipment_id) 

   FOREIGN KEY (engid) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

/*creating equipment_maintanance table*/ 

CREATE TYPE fixed_eqp_maint_objtyp AS OBJECT ( 

fixed_equipment_id  REF fixed_equipment_objtyp, 

engid REF sound_eng_objtyp, 

maintanance_interval VARCHAR2(10), 

maintance_month VARCHAR2(10), 

maintance_day NUMBER(2) 

); 

/ 

 

CREATE TABLE fixed_eqp_maint OF fixed_eqp_maint_objtyp (  

   PRIMARY KEY (fixed_equipment_id ) 

   FOREIGN KEY (engid) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

 

 

/*creating equipment_repairing table*/ 

CREATE TYPE portable_eqp_repaire_objtyp AS OBJECT 

(repaire_id VARCHAR2(4), 

portable_equipment_id REF portable_equipment_objtyp, 

engid REF sound_eng_objtyp, 

damage_date DATE, 

repaire_date DATE, 

cost_of_repaire NUMBER(10) 

); 

/ 

 

CREATE TABLE portable_eqp_repaire OF portable_eqp_repaire_objtyp (  

   PRIMARY KEY (repaire_id) 

   FOREIGN KEY (portable_equipment_id) REFERENCES portable_equipment_objtyp 

   FOREIGN KEY (engid) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

/*creating equipment_repairing table*/ 

CREATE TYPE fixed_eqp_repaire_objtyp AS OBJECT 

(repaire_id VARCHAR2(4), 

fixed_equipment_id REF fixed_equipment_objtyp, 

engid REF sound_eng_objtyp, 

damage_date DATE, 

repaire_date DATE, 

cost_of_repaire NUMBER(10) 

); 

/ 

 

 

CREATE TABLE fixed_eqp_repaire OF fixed_eqp_repaire_objtyp (  

   PRIMARY KEY (repaire_id) 

   FOREIGN KEY (fixed_equipment_id) REFERENCES fixed_equipment_objtyp 

   FOREIGN KEY (engid) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

CREATE TYPE port_eqp_transport_objtyp AS OBJECT 

(portable_equipment_id REF portable_equipment_objtyp, 

driverid REF sound_eng_objtyp, 

gate_pass_id VARCHAR2(4), 

transport_date DATE, 

start_location VARCHAR2(30), 

delivery_location VARCHAR2(30) 

); 

/ 

 

 

CREATE TABLE port_eqp_transport OF port_eqp_transport_objtyp (  

   PRIMARY KEY (portable_equipment_id,engid) 

   FOREIGN KEY (portable_equipment_id) REFERENCES portable_equipment_objtyp 

   FOREIGN KEY (engid) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

/*creating project_type object*/ 

CREATE TYPE project_type_objtyp AS OBJECT 

(project_type_id VARCHAR2(4), 

project_type_descr VARCHAR2(10) 

); 

/ 

 

CREATE TABLE project_type OF project_type_objtyp (  

   PRIMARY KEY  (project_type_id)  

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

 

CREATE TYPE customer_address_objtyp AS OBJECT ( 

  Street         VARCHAR2(200), 

  City           VARCHAR2(200), 

  State          CHAR(2), 

  Zip            VARCHAR2(20) 

  ) ; 

/ 

 

 

 

 

/*creating customer table*/ 

CREATE TYPE cutomer_objtyp AS OBJECT 

(cusid VARCHAR2(10), 

fname VARCHAR2(15), 

lname VARCHAR2(15), 

title VARCHAR2(4), 

gender VARCHAR(4), 

address REF customer_address_objtyp, 

sound_eng_id REF sound_eng_objtyp 

); 

/ 

 

CREATE TABLE cutomer OF cutomer_objtyp (  

   PRIMARY KEY (cusid) 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

 

/*creating portable_order_request table*/ 

/*DROP TABLE poratable_order_request*/ 

CREATE TYPE poratable_order_request_objtyp AS OBJECT 

(portable_reqid VARCHAR2(4), 

request_date DATE, 

start_date DATe, 

end_date DATE, 

portable_equipment_id REF portable_equipment_objtyp, 

cusid REF cutomer_objtyp, 

cutomer_expertise_level VARCHAR2(10), 

project_type_id REF project_type_objtyp 

); 

/ 

 

 

CREATE TABLE poratable_order_request OF poratable_order_request_objtyp (  

   PRIMARY KEY (portable_reqid) 

   FOREIGN KEY (portable_equipment_id) REFERENCES portable_equipment_objtyp 

   FOREIGN KEY (cusid) REFERENCES cutomer_objtyp 

   FOREIGN KEY (project_type_id) REFERENCES project_type_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

 

/*creating fixed_order_request table*/ 

/*DROP TABLE fixed_order_request*/ 

CREATE TYPE fixed_order_request_objtyp AS OBJECT 

(fixed_reqid VARCHAR2(4), 

request_date DATE, 

start_date DATe, 

end_date DATE, 

fixed_equipment_id REF fixed_equipment_objtyp, 

cusid REF cutomer_objtyp, 

cutomer_expertise_level VARCHAR2(10), 

project_type_id VARCHAR2(4) 

); 

/ 

 

CREATE TABLE fixed_order_request OF fixed_order_request_objtyp (  

   PRIMARY KEY (fixed_reqid) 

   FOREIGN KEY (fixed_equipment_id) REFERENCES fixed_equipment_objtyp 

   FOREIGN KEY (cusid) REFERENCES cutomer_objtyp 

   FOREIGN KEY (project_type_id) REFERENCES project_type_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

 

/*creating portabal_hiring_agreement table*/ 

CREATE TYPE portable_hiring_agr_objtyp AS OBJECT 

(portable_hiring_agreement_id VARCHAR2(4), 

hiring_date DATE, 

return_date DATE, 

initial_cost NUMBER, 

additinal_insurance NUMBER 

); 

/ 

 

 

CREATE TABLE portable_hiring_agr OF portable_hiring_agr_objtyp (  

   PRIMARY KEY (portable_hiring_agreement_id) 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

/*creating fixed_hiring_agreement table*/ 

CREATE TYPE fixed_hiring_agr_objtyp AS OBJECT  

(fixed_hiring_agreement_id VARCHAR2(4), 

hiring_date DATE, 

return_date DATE, 

total_hours NUMBER, 

hourly_rate NUMBER, 

sound_eng_id REF sound_eng_objtyp 

); 

/ 

 

CREATE TABLE fixed_hiring_agr OF fixed_hiring_agr_objtyp (  

   PRIMARY KEY (fixed_hiring_agreement_id) 

   FOREIGN KEY (sound_eng_id ) REFERENCES sound_eng_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

 

/*creating portable_order_approval table*/ 

CREATE TYPE poratable_order_aprvl_objtyp AS OBJECT  

(portable_reqid REF poratable_order_request_objtyp, 

sound_eng_id REF sound_eng_objtyp, 

portable_hiring_agreement_id REF portable_hiring_agr_objtyp, 

equipment_availability VARCHAR2(4), 

approval_status VARCHAR2(4) 

); 

/ 

 

CREATE TABLE poratable_order_aprvl OF poratable_order_aprvl_objtyp  (  

   /*PRIMARY KEY (fixed_hiring_agreement_id)*/ 

   FOREIGN KEY (portable_reqid) REFERENCES poratable_order_request_objtyp 

   FOREIGN KEY (sound_eng_id) REFERENCES sound_eng_objtyp 

   FOREIGN KEY (portable_hiring_agreement_id) REFERENCES portable_hiring_agr_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

  

 

/*creating fixed_order_approval table*/ 

CREATE TYPE fixed_order_aprvl_objtyp AS OBJECT  

(fixed_reqid REF fixed_order_request_objtyp, 

sound_eng_id REF sound_eng_objtyp, 

fixed_hiring_agreement_id REF fixed_hiring_agr_objtyp, 

equipment_availability VARCHAR2(4), 

approval_states VARCHAR2(4) 

); 

/ 

 

CREATE TABLE fixed_order_aprvl OF fixed_order_aprvl_objtyp  (  

   PRIMARY KEY (fixed_reqid,sound_eng_id,fixed_hiring_agreement_id) 

   FOREIGN KEY (fixed_reqid) REFERENCES fixed_order_request_objtyp 

   FOREIGN KEY (sound_eng_id) REFERENCES sound_eng_objtyp 

   FOREIGN KEY (fixed_hiring_agreement_id) REFERENCES fixed_hiring_agr_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

  

 

 

CREATE TYPE fix_eqp_hiring_to_cust_objtyp AS OBJECT  

(fixed_hiring_agreement_id REF fixed_hiring_agr_objtyp, 

fixed_equipment_id REF fixed_equipment_objtyp, 

cusid REF cutomer_objtyp 

); 

/ 

 

CREATE TABLE fix_eqp_hiring_to_cust OF fix_eqp_hiring_to_cust_objtyp  (  

   PRIMARY KEY (fixed_hiring_agreement_id,cusid,fixed_equipment_id) 

   FOREIGN KEY (fixed_hiring_agreement_id) REFERENCES fixed_hiring_agr_objtyp 

   FOREIGN KEY (cusid) REFERENCES cutomer_objtyp 

   FOREIGN KEY (fixed_equipment_id) REFERENCES fixed_equipment_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 

 

CREATE TYPE port_eqp_hiring_to_cust_objtyp AS OBJECT 

(portable_hiring_agreement_id REF portable_hiring_agr_objtyp, 

portable_equipment_id REF portable_equipment_objtyp, 

cusid REF cutomer_objtyp 

); 

/ 

 

CREATE TABLE port_eqp_hiring_to_cust OF port_eqp_hiring_to_cust_objtyp  (  

   PRIMARY KEY (portable_hiring_agreement_id,cusid,portable_equipment_id) 

   FOREIGN KEY (portable_hiring_agreement_id) REFERENCES portable_hiring_agr_objtyp 

   FOREIGN KEY (cusid) REFERENCES cutomer_objtyp 

   FOREIGN KEY (portable_equipment_id) REFERENCES portable_equipment_objtyp 

   OBJECT IDENTIFIER IS PRIMARY KEY 

   ); 

/ 