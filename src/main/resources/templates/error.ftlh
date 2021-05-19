<!DOCTYPE html>
<html lang="en">
  <head>
    <title>KSSR</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <style>
      html {
        height: 100%;
      }
      body {
        height: 100%;
        display: flex;
      }
    </style>
  </head>
  <body>
    <h1 class="display-1 w-100 text-center m-auto">
      <#if status_code == 404> ERROR 404 PAGE NOT FOUND </#if>
      <#if status_code == 500> ERROR 500 SERVER ERROR</#if>
    </h1>
  </body>
</html>
