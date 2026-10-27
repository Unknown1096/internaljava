
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration</title>

    <style>
        * {
            box-sizing: border-box;
        }

        :root {
            --primary: #3157d5;
            --primary-dark: #2343ad;
            --text: #172033;
            --muted: #718096;
            --border: #e2e8f0;
            --background: #f3f6fc;
            --white: #ffffff;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background:
                radial-gradient(circle at top left, #e0eaff, transparent 35%),
                var(--background);
            color: var(--text);
            margin: 0;
            min-height: 100vh;
            padding: 35px 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 540px;
            background: var(--white);
            padding: 38px;
            border: 1px solid #e8edf6;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(34, 57, 100, 0.10);
            animation: appear 0.55s ease-out;
        }

        @keyframes appear {
            from {
                opacity: 0;
                transform: translateY(18px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 30px;
        }

        .brand-icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #e9efff;
            color: var(--primary);
            border-radius: 14px;
            font-size: 25px;
            font-weight: bold;
        }

        .brand-name {
            font-size: 17px;
            font-weight: 750;
            letter-spacing: -0.4px;
        }

        .brand-subtitle {
            margin-top: 4px;
            color: var(--muted);
            font-size: 12px;
        }

        .header {
            margin-bottom: 28px;
        }

        .eyebrow {
            color: var(--primary);
            text-transform: uppercase;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.6px;
            margin-bottom: 10px;
        }

        .header h2 {
            font-size: 30px;
            letter-spacing: -1px;
            margin: 0 0 9px;
            color: #172b4d;
        }

        .header p {
            color: var(--muted);
            font-size: 14px;
            line-height: 1.6;
            margin: 0;
        }

        .form-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0 16px;
        }

        .field {
            margin-bottom: 19px;
            min-width: 0;
        }

        .field.full {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            font-weight: 700;
            color: #34425a;
        }

        input {
            display: block;
            width: 100%;
            min-width: 0;
            padding: 13px 14px;
            border: 1px solid var(--border);
            border-radius: 10px;
            background: #fbfcff;
            color: var(--text);
            font-size: 14px;
            font-family: inherit;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s,
                        background 0.2s;
        }

        input::placeholder {
            color: #a0aec0;
        }

        input:hover {
            border-color: #bdc9df;
        }

        input:focus {
            border-color: var(--primary);
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(49, 87, 213, 0.10);
        }

        .error {
            color: #b42318;
            background: #fff1f0;
            border: 1px solid #fecaca;
            border-radius: 10px;
            padding: 13px 15px;
            font-size: 13px;
            margin: 0 0 22px;
        }

        button {
            width: 100%;
            margin-top: 5px;
            padding: 15px;
            background: var(--primary);
            color: #ffffff;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 700;
            font-family: inherit;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(49, 87, 213, 0.20);
            transition: background 0.2s, transform 0.2s,
                        box-shadow 0.2s;
        }

        button:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 9px 20px rgba(49, 87, 213, 0.26);
        }

        button:active {
            transform: translateY(0);
        }

        .secure-note {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            color: var(--muted);
            font-size: 12px;
            margin-top: 16px;
        }

        .footer {
            text-align: center;
            margin-top: 27px;
            padding-top: 22px;
            border-top: 1px solid #edf0f6;
            font-size: 13px;
            color: var(--muted);
        }

        a {
            color: var(--primary);
            font-weight: 700;
            text-decoration: none;
            margin-left: 4px;
            transition: color 0.2s;
        }

        a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        @media (max-width: 520px) {
            body {
                padding: 20px 12px;
            }

            .container {
                padding: 26px 21px;
                border-radius: 16px;
            }

            .header h2 {
                font-size: 26px;
            }

            .form-section {
                grid-template-columns: 1fr;
            }

            .field.full {
                grid-column: auto;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <div class="brand">
        <div class="brand-icon">E</div>
        <div>
            <div class="brand-name">Employee Portal</div>
            <div class="brand-subtitle">Human Resources Management</div>
        </div>
    </div>

    <div class="header">
        <div class="eyebrow">Employee Management</div>
        <h2>Register Employee</h2>
        <p>Complete the details below to add a new employee to your organization.</p>
    </div>

    <c:if test="${not empty errorMessage}">
        <p class="error"><c:out value="${errorMessage}"/></p>
    </c:if>

    <form action="${pageContext.request.contextPath}/employees"
          method="post">

        <div class="form-section">

            <div class="field full">
                <label for="name">Employee Name</label>
                <input
                    id="name"
                    type="text"
                    name="name"
                    placeholder="Enter full name"
                    value="<c:out value='${employee.name}'/>"
                    required
                    maxlength="100">
            </div>

            <div class="field full">
                <label for="email">Email Address</label>
                <input
                    id="email"
                    type="email"
                    name="email"
                    placeholder="employee@company.com"
                    value="<c:out value='${employee.email}'/>"
                    required
                    maxlength="150">
            </div>

            <div class="field">
                <label for="department">Department</label>
                <input
                    id="department"
                    type="text"
                    name="department"
                    placeholder="e.g. Engineering"
                    value="<c:out value='${employee.department}'/>"
                    required
                    maxlength="100">
            </div>

            <div class="field">
                <label for="salary">Salary</label>
                <input
                    id="salary"
                    type="number"
                    name="salary"
                    placeholder="e.g. 45000"
                    min="0.01"
                    step="0.01"
                    value="<c:out value='${employee.salary}'/>"
                    required>
            </div>

        </div>

        <button type="submit">Register Employee &#8594;</button>

        <div class="secure-note">
            <span>&#10003;</span>
            <span>Please verify the details before submitting.</span>
        </div>

    </form>

    <div class="footer">
        Already registered?
        <a href="${pageContext.request.contextPath}/employees">
            View Employee List &#8594;
        </a>
    </div>

</div>

</body>
</html>
