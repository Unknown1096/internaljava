
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration | PeopleHub</title>

    <style>
        * {
            box-sizing: border-box;
        }

        :root {
            --navy: #101c2c;
            --navy-light: #192a40;
            --teal: #20c9a6;
            --text: #19283c;
            --muted: #718096;
            --border: #e4eaf0;
            --white: #ffffff;
        }

        body {
            margin: 0;
            min-height: 100vh;
            padding: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #edf1f5;
            color: var(--text);
        }

        .layout {
            display: grid;
            grid-template-columns: 0.85fr 1.15fr;
            width: 100%;
            max-width: 1050px;
            min-height: 650px;
            background: var(--white);
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 25px 80px rgba(16, 28, 44, 0.15);
            animation: enter 0.6s ease-out;
        }

        @keyframes enter {
            from {
                opacity: 0;
                transform: translateY(15px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Left information panel */
        .sidebar {
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 42px 35px;
            color: white;
            background:
                radial-gradient(circle at 100% 5%,
                    rgba(32, 201, 166, 0.22), transparent 35%),
                linear-gradient(145deg, var(--navy), #172d45);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            position: relative;
            z-index: 1;
        }

        .brand-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 44px;
            height: 44px;
            border-radius: 13px;
            background: var(--teal);
            color: var(--navy);
            font-size: 23px;
            font-weight: 900;
        }

        .brand-name {
            font-size: 19px;
            font-weight: 750;
            letter-spacing: -0.5px;
        }

        .brand-caption {
            margin-top: 4px;
            color: #a6b7c9;
            font-size: 11px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .side-content {
            position: relative;
            z-index: 1;
            margin: 45px 0;
        }

        .tag {
            display: inline-block;
            padding: 8px 12px;
            border: 1px solid rgba(32, 201, 166, 0.4);
            border-radius: 30px;
            color: #64e5c7;
            background: rgba(32, 201, 166, 0.08);
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .side-content h1 {
            max-width: 330px;
            margin: 24px 0 17px;
            font-size: clamp(32px, 4vw, 43px);
            line-height: 1.15;
            letter-spacing: -1.5px;
        }

        .side-content h1 span {
            color: var(--teal);
        }

        .side-content p {
            max-width: 320px;
            color: #afbdcc;
            font-size: 14px;
            line-height: 1.9;
        }

        .benefits {
            margin-top: 34px;
            display: grid;
            gap: 17px;
        }

        .benefit {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 13px;
            color: #dce5ee;
        }

        .check {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 25px;
            height: 25px;
            flex-shrink: 0;
            border-radius: 8px;
            background: rgba(32, 201, 166, 0.13);
            color: var(--teal);
            font-weight: bold;
        }

        .side-footer {
            position: relative;
            z-index: 1;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.12);
            color: #9aabbd;
            font-size: 11px;
            line-height: 1.8;
        }

        .circle {
            position: absolute;
            width: 240px;
            height: 240px;
            right: -115px;
            bottom: 100px;
            border: 1px solid rgba(32, 201, 166, 0.14);
            border-radius: 50%;
        }

        .circle::before,
        .circle::after {
            content: "";
            position: absolute;
            border: 1px solid rgba(32, 201, 166, 0.13);
            border-radius: 50%;
        }

        .circle::before {
            inset: 25px;
        }

        .circle::after {
            inset: 50px;
        }

        /* Right registration form */
        .main {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 45px 48px;
        }

        .form-heading {
            margin-bottom: 30px;
        }

        .step {
            color: #159d83;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.6px;
            text-transform: uppercase;
        }

        .form-heading h2 {
            margin: 11px 0 8px;
            color: var(--navy);
            font-size: 29px;
            letter-spacing: -1px;
        }

        .form-heading p {
            margin: 0;
            color: var(--muted);
            font-size: 13px;
            line-height: 1.7;
        }

        .error {
            margin: 0 0 20px;
            padding: 13px 15px;
            border: 1px solid #fecaca;
            border-radius: 10px;
            background: #fff1f2;
            color: #b42318;
            font-size: 13px;
            overflow-wrap: anywhere;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 21px 16px;
        }

        .field {
            min-width: 0;
        }

        .field.full {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 9px;
            color: #344256;
            font-size: 12px;
            font-weight: 750;
        }

        .input-wrap {
            position: relative;
        }

        .input-symbol {
            position: absolute;
            top: 50%;
            left: 14px;
            transform: translateY(-50%);
            color: #91a0b2;
            font-size: 15px;
            pointer-events: none;
        }

        input {
            width: 100%;
            min-width: 0;
            padding: 14px 13px 14px 39px;
            border: 1px solid var(--border);
            border-radius: 10px;
            outline: none;
            background: #f9fbfd;
            color: var(--text);
            font-family: inherit;
            font-size: 13px;
            transition: 0.2s ease;
        }

        input::placeholder {
            color: #a8b3c0;
        }

        input:hover {
            border-color: #c3d0dc;
        }

        input:focus {
            border-color: #18b99a;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(32, 201, 166, 0.10);
        }

        .submit-btn {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            width: 100%;
            margin-top: 28px;
            padding: 15px;
            border: 0;
            border-radius: 10px;
            background: var(--navy);
            color: white;
            font-family: inherit;
            font-size: 14px;
            font-weight: 750;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .submit-btn:hover {
            background: #203b56;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(16, 28, 44, 0.16);
        }

        .submit-btn span {
            color: var(--teal);
            font-size: 19px;
        }

        .privacy {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 7px;
            margin-top: 15px;
            color: #8491a2;
            font-size: 11px;
        }

        .privacy span {
            color: #159d83;
        }

        .footer {
            margin-top: 27px;
            padding-top: 22px;
            border-top: 1px solid #edf0f4;
            text-align: center;
            color: var(--muted);
            font-size: 12px;
        }

        a {
            color: #118e78;
            font-weight: 750;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 850px) {
            body {
                padding: 20px;
            }

            .layout {
                max-width: 570px;
                grid-template-columns: 1fr;
            }

            .sidebar {
                padding: 30px;
            }

            .side-content {
                margin: 32px 0;
            }

            .side-content h1 {
                max-width: 450px;
                font-size: 34px;
            }

            .benefits {
                grid-template-columns: 1fr 1fr;
            }

            .side-footer {
                display: none;
            }

            .main {
                padding: 35px 30px;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 12px;
            }

            .layout {
                border-radius: 16px;
            }

            .sidebar {
                padding: 25px 22px;
            }

            .side-content h1 {
                font-size: 30px;
            }

            .benefits {
                grid-template-columns: 1fr;
            }

            .main {
                padding: 30px 22px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 19px;
            }

            .field.full {
                grid-column: auto;
            }

            .form-heading h2 {
                font-size: 26px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            *, *::before, *::after {
                animation-duration: 0.01ms !important;
                transition-duration: 0.01ms !important;
            }
        }
    </style>
</head>

<body>

<div class="layout">

    <aside class="sidebar">

        <div class="brand">
            <div class="brand-icon">P</div>
            <div>
                <div class="brand-name">PeopleHub</div>
                <div class="brand-caption">Employee Portal</div>
            </div>
        </div>

        <div class="side-content">
            <div class="tag">People first. Always.</div>

            <h1>Build your future with <span>great people.</span></h1>

            <p>
                Create an employee profile and keep your organization's
                workforce information organized in one place.
            </p>

            <div class="benefits">
                <div class="benefit">
                    <div class="check">&#10003;</div>
                    <span>Simple employee registration</span>
                </div>

                <div class="benefit">
                    <div class="check">&#10003;</div>
                    <span>Organized employee information</span>
                </div>

                <div class="benefit">
                    <div class="check">&#10003;</div>
                    <span>Quick access to employee records</span>
                </div>
            </div>
        </div>

        <div class="side-footer">
            PEOPLEHUB · EMPLOYEE MANAGEMENT<br>
            A better way to manage employee information.
        </div>

        <div class="circle"></div>

    </aside>

    <main class="main">

        <div class="form-heading">
            <div class="step">NEW EMPLOYEE &nbsp; / &nbsp; REGISTRATION</div>
            <h2>Create employee profile</h2>
            <p>Enter the employee details in the fields below.</p>
        </div>

        <c:if test="${not empty errorMessage}">
            <p class="error"><c:out value="${errorMessage}"/></p>
        </c:if>

        <form action="${pageContext.request.contextPath}/employees"
              method="post">

            <div class="form-grid">

                <div class="field full">
                    <label for="name">FULL NAME</label>
                    <div class="input-wrap">
                        <span class="input-symbol" aria-hidden="true">&#128100;</span>
                        <input
                            id="name"
                            type="text"
                            name="name"
                            placeholder="Enter employee's full name"
                            value="<c:out value='${employee.name}'/>"
                            required
                            maxlength="100">
                    </div>
                </div>

                <div class="field full">
                    <label for="email">EMAIL ADDRESS</label>
                    <div class="input-wrap">
                        <span class="input-symbol" aria-hidden="true">&#9993;</span>
                        <input
                            id="email"
                            type="email"
                            name="email"
                            placeholder="name@company.com"
                            value="<c:out value='${employee.email}'/>"
                            required
                            maxlength="150">
                    </div>
                </div>

                <div class="field">
                    <label for="department">DEPARTMENT</label>
                    <div class="input-wrap">
                        <span class="input-symbol" aria-hidden="true">&#127970;</span>
                        <input
                            id="department"
                            type="text"
                            name="department"
                            placeholder="e.g. Engineering"
                            value="<c:out value='${employee.department}'/>"
                            required
                            maxlength="100">
                    </div>
                </div>

                <div class="field">
                    <label for="salary">SALARY</label>
                    <div class="input-wrap">
                        <span class="input-symbol" aria-hidden="true">&#8377;</span>
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

            </div>

            <button class="submit-btn" type="submit">
                Register Employee <span aria-hidden="true">&#8594;</span>
            </button>

            <div class="privacy">
                <span aria-hidden="true">&#10003;</span>
                Check all details before submitting.
            </div>

        </form>

        <div class="footer">
            Already registered?
            <a href="${pageContext.request.contextPath}/employees">
                View Employee List &#8594;
            </a>
        </div>

    </main>

</div>

</body>
</html>
