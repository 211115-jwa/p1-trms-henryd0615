package com.revature.controllers;

import java.util.Set;

import com.revature.beans.Employee;
import com.revature.data.EmployeeDAO;

import io.javalin.http.Context;

public class EmployeesController {
	private static EmployeeDAO empDao = new EmployeeDAO();
	private static Employee employee = new Employee();
	
public static void viewAllEmployees(Context ctx) {
		Set<Employee> employees = empDao.getAll();
		ctx.json(employees);
	}

	public static void viewEmployeeById(Context ctx) {
		int id = Integer.parseInt(ctx.pathParam("empId"));

		try {	
		employee = empDao.getById(id);
		
		if (id != 0) {
			ctx.json(employee);
			
		} else {
			ctx.status(404);
			ctx.result("The employee does not exist.");
		}
		
	} catch (NumberFormatException e) {
		ctx.status(400);
		ctx.result("Employee ID must be an integer. Please try again.");
	}
		
	}
}