<%--
  Created by IntelliJ IDEA.
  User: yurii.ukrainets
  Date: 9/24/2018
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/edit_input.css">
</head>
<body>
<h3>Add User</h3>

<div class="container">
    <form id="contact" action="/users/add" method="post" class="tg">
        First name:<br>
        <input type="text" name="firstName" placeholder="John" data-rule="required"><br>
        <span class="reqMsg" id="firstN">* First name is required</span><br>
        Last name:<br>
        <input type="text" name="lastName" placeholder="Stevens" data-rule="required"><br>
        <span class="reqMsg" id="lastN">* Last name is required</span><br>
        Age:<br>
        <input type="number" name="age" placeholder="25" data-rule="required"><br>
        <span class="reqMsg" id="age">* Age is required</span><br>
        Email:<br>
        <input type="text" name="email" placeholder="email@example.com" data-rule="required email"><br>
        <span class="reqMsg" id="email_wrong_format">* Email doesn't match pattern</span><br>
        <span class="reqMsg" id="email">* Email is required</span><br>
        City:<br>
        <select name="city" data-rule="required">
            <option selected value="Lviv">Lviv</option>
            <option value="Kyiv">Kyiv</option>
            <option value="Kharkiv">Kharkiv</option>
        </select><br><br>
        Phone:<br>
        <input type="text" name="phone" placeholder="+38(063)1234567"
               value="+38" data-rule="required phone length" maxlength="13"><br>
        <span class="reqMsg" id="phone_wrong_format">* Phone doesn't match pattern</span><br>
        <span class="reqMsg" id="phone">* Phone is required</span>
        <span class="reqMsg" id="phone_length">* Phone is too short</span><br>
        <input hidden type="text" name="role_id" value="3" disabled/>
        <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
    </form>
</div>

</body>
</html>

<script>
    var element = document.getElementsByTagName('form');

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
