--DML

insert into user_role (role_id, role_name) values 
	(default, 'Department Head'),
	(default, 'Employee');

insert into status (status_id, status_name, approver) values 
	(default, 'Approved', 'Direct Supervisor'),
	(default, 'Approved', 'Department Head'),
	(default, 'Approved', 'Benefits Coordinator'),
	(default, 'Pending Approval', 'Direct Supervisor'),
	(default, 'Pending Approval', 'Department Head'),
	(default, 'Pending Approval', 'Benefits Coordinator'),
	(default, 'Rejected', 'Direct Supervisor'),
	(default, 'Rejected', 'Department Head'),
	(default, 'Rejected', 'Benefits Coordinator');

insert into grading_format (format_id, format_name, example) values
	(default, 'Pass/fail', 'Passed');

insert into event_type (type_id, type_name, percent_coverage) values
	(default, 'University Courses', 80.0),
	(default, 'Seminars', 60.0),
	(default, 'Certification Preparation Classes', 75.0),
	(default, 'Certification', 100.0),
	(default, 'Technical Training', 90.0),
	(default, 'Other', 30.0);

insert into employee (emp_id, first_name, last_name, username, passwd, role_id, funds) values 
	(default, 'Juan', 'Soto', 'jsoto1', 'jsoto11', 1, '1000.00');

insert into reimbursement (req_id, event_date, event_time, location, description, cost, grading_format_id, event_type_id, status_id, submitted_at, emp_id) values
	(default, '1999-01-08', '04:05:06', 'University', 'a university course', 1000.0, 1, 1, 1, '1999-01-08 04:05:06', 3);

insert into comment (comment_id, comment_text, sent_at, approver_id, req_id) values
	(default, 'Comment', '2000-06-15 05:04:06', 1, 1);

insert into department (dept_id, dept_name) values
	(default, 'Head Department');