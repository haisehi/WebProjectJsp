<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="Admin.css">
<title>ADMIN</title>
</head>
<body>
	<div>
		<!-- body -->
		<div class="wrapper_loginOrSignUp">
			<div class="form">
				<form method="POST" class="form_account"
					action="${pageContext.request.contextPath}/Admin">
					<label class="label_account">login</label>
					<div class="label-form_account">
						<input type="text" id="" class="input-form_account"
							name="username" required /> <label id="" for=""
							class="label_input">User Name:</label>
					</div>
					<div class="label-form_account">
						<input type="password" id="" class="input-form_account"
							name="password" required /> <label id="" for=""
							class="label_input">Password:</label>
					</div>
					<input type="submit" class="button_account" name="action"
						value="login" />
				</form>
			</div>
			<div>
			
			</div>
		</div>
	</div>
</body>
</html>
