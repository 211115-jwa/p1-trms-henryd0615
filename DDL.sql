--create schema p1_trms;
--DDL

create table user_role (
		role_id serial primary key,
		role_name varchar(80) not null
);

create table status (
		status_id serial primary key,
		status_name varchar(50) not null,
		approver varchar(50) not null
);

create table grading_format (
		format_id serial primary key,
		format_name varchar(80) not null,
		example varchar(200)
);

create table event_type (
		type_id serial primary key,
		type_name varchar(80) not null,
		percent_coverage integer not null
);

create table comment (
		comment_id serial primary key,
		req_id integer references reimbursement,
		approver_id integer references employee,
		comment_text varchar(200) not null,
		sent_at timestamp not null
		
);

create table employee (
	emp_id serial primary key ,
	first_name varchar(80) not null,
	last_name varchar(80) not null,
	username varchar(80) not null,
	passwd varchar(80) not null,
	role_id integer not null references user_role,
	funds real not null,
	supervisor_id integer references employee,
	dept_id integer references department 
);

create table reimbursement (
		req_id serial primary key,
		emp_id integer not null,
		event_date date,
		event_time time,
		location varchar(50) not null,
		description varchar(200) not null,
		cost real not null,
		grading_format_id integer not null references grading_format,
		event_type_id integer not null references event_type,
		status_id integer not null references status,
		submitted_at timestamp not null
);

create table department (
		dept_id serial primary key,
		dept_name varchar(50) not null,
		dept_head_id integer 
);



