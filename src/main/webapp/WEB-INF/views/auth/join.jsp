<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Costagram</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    rel="stylesheet">
    <link rel="shortcut icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
  <main id="login">
    <div class="login__column">
      <img src="/images/phoneImage.png" />
    </div>
    <div class="login__column">
      <div class="login__box">
        <img src="/images/loginLogo.png" />
        <form action="/auth/joinProc" method="post" class="login__form">
          <input type="email" name="email" placeholder="Email" required>
          <input type="text" name="name" placeholder="Name" required>
          <input type="text" name="username" placeholder="Username" required>
          <input type="password" name="password" placeholder="Password" required>
          <input type="submit" value="Sign up">
        </form>
      </div>
      <div class="login__box">
        <span class="login__text">
          Do you have an account? <br />
        </span>
        <a class="login__blue-link" href="/auth/login">Sign in</a>
      </div>
      <div class="login__t-box">
        <span class="login__text">
          Get the app.
        </span>
        <div class="login__appstores">
          <img src="/images/ios.png" class="login__appstore" />
          <img src="/images/android.png" class="login__appstore" />
        </div>
      </div>
    </div>
  </main>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>

