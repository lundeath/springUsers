<%--
  Created by IntelliJ IDEA.
  User: yurii.ukrainets
  Date: 9/26/2018
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
<style>
    .reqMsg {
        color:red;
        display: none;
    }
    .tg {
        border-collapse: collapse;
        border-spacing: 0;
        border-color: #ccc;
    }

    .tg td {
        font-family: Arial, sans-serif;
        font-size: 14px;
        padding: 10px 5px;
        border-style: solid;
        border-width: 1px;
        overflow: hidden;
        word-break: normal;
        border-color: #ccc;
        color: #333;
        background-color: #fff;
    }

    .tg th {
        font-family: Arial, sans-serif;
        font-size: 14px;
        font-weight: normal;
        padding: 10px 5px;
        border-style: solid;
        border-width: 1px;
        overflow: hidden;
        word-break: normal;
        border-color: #ccc;
        color: #333;
        background-color: #f0f0f0;
    }

    .tg .tg-4eph {
        background-color: #f9f9f9
    }

</style>
</head>
<body>
<h3>Login</h3>

<div>
    <form style="alignment: center" name="loginForm" action="/users/login" method="post" class="tg">
        First name:<br>
        <input type="text" name="firstName" placeholder="John" data-rule="required"><br>
        <span class="reqMsg" id="firstN">* First name is required</span><br>
        Last name:<br>
        <input type="text" name="lastName" placeholder="Stevens" data-rule="required"><br>
        <span class="reqMsg" id="lastN">* Last name is required</span><br>
        <input type="submit" value="Login"/><br>
    </form>
</div>
</body>
</html>

<script>
    var element = document.getElementsByName('loginForm');

    element[0].addEventListener('submit', validate);


    var rules = {
        required: function (element) {
            if (element.value !== '') {
                return true;
            }
            return false;
        },
        email: function (element) {
            var reg = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/;
            return reg.test(element.value);
        },
        phone: function (element) {
            var reg = /^[\+]\d*$/;
            return reg.test(element.value);
        },
        length: function (element) {
            return element.value.length > 11;
        }
    };

    function showErrors(arr) {
        for (var i = 0; i < arr.length; i++) {
            if(arr[i].name === "firstName" && arr[i].error === "required"){
                document.getElementById("firstN").style.display = "inline";
            }
            if(arr[i].name === "lastName" && arr[i].error === "required"){
                document.getElementById("lastN").style.display = "inline";
            }
            if(arr[i].name === "age" && arr[i].error === "required"){
                document.getElementById("age").style.display = "inline";
            }
            if(arr[i].name === "email" && arr[i].error === "required"){
                document.getElementById("email").style.display = "inline";
            }
            if(arr[i].name === "email" && arr[i].error === "email"){
                document.getElementById("email_wrong_format").style.display = "inline";
            }
            if(arr[i].name === "phone" && arr[i].error === "required"){
                document.getElementById("phone").style.display = "inline";
            }
            if(arr[i].name === "phone" && arr[i].error === "phone"){
                document.getElementById("phone_wrong_format").style.display = "inline";
            }
            if(arr[i].name === "phone" && arr[i].error === "length"){
                document.getElementById("phone_length").style.display = "inline";
            }
        }
    }

    function validate(e) {
        cleanErrors();
        var errors = [];
        var inputs = this.elements;

        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type !== 'submit') {
                var rulesList = inputs[i].dataset.rule;
                rulesList = rulesList.split(' ');

                for (var j = 0; j < rulesList.length; j++) {
                    if (rulesList[j] in rules) {
                        if (!rules[rulesList[j]](inputs[i])) {
                            errors.push({
                                name: inputs[i].name,
                                error: rulesList[j]
                            })
                        }
                    }
                }
            }
        }
        if (errors.length > 0) {
            e.preventDefault();
            showErrors(errors);
        }
    }

    function cleanErrors() {
        var elements = document.getElementsByClassName("reqMsg");
        for (var i = 0; i < elements.length; i++) {
            elements[i].style.display = "none";
        }
    }
</script>
