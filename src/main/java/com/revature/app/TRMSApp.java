package com.revature.app;

import io.javalin.Javalin;
import io.javalin.http.HttpCode;

import static io.javalin.apibuilder.ApiBuilder.*;

import com.revature.controllers.RequestsController;
import com.revature.controllers.EmployeesController;
import com.revature.controllers.UsersController;

public class TRMSApp {

	public static void main(String[] args) {
		Javalin app = Javalin.create(config -> {
			config.enableCorsForAllOrigins();
		}).start();

		app.before("/employees/*", ctx -> {
			if (!ctx.method().equals("OPTIONS")) {
				ctx.header("Access-Control-Allow-Headers", "Token");
				ctx.header("Access-Control-Expose-Headers", "Token");

				String token = ctx.header("Token");
				if (token == null)
					ctx.status(HttpCode.UNAUTHORIZED);
			}
		});

		app.routes(() -> {
			path("/employees", () -> {
				get(EmployeesController::viewAllEmployees);

				path("/id/{empId}", () -> {
					get(EmployeesController::viewEmployeeById);

				});
			});

			app.routes(() -> {
				path("/requests", () -> {
					post(RequestsController::submitReimbursementRequest);
					path("/requestor/{id}", () -> {
						get(RequestsController::getRequestsByRequestor);
					});
				});

				path("/users", () -> {
					post(UsersController::register);
					path("/auth", () -> {
						post(UsersController::logIn);
					});
					path("/{id}", () -> {
						get(UsersController::getUserById);
						put(UsersController::updateUser);
						path("/auth", () -> {
							get(UsersController::checkLogin);
						});
					});
				});
			});
		});
	}
}
