<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <c:set var="contactList" value='${requestScope["contactList"]}'/>
    <c:set var="currentContact" value='${requestScope["currentContact"]}'/>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/phonebook.css"/>
    <title>Phone book</title>
</head>
<body>

<div class="delete-dialog"></div>

<div class="alert" title="Нет выбранных контактов"></div>
<div class="content">
    <div class="filter-container">
        <label class="filter-label mb-0 mr-2">
            Введите текст:
            <input type="text" class="form-control input-sm"/>
        </label>
        <button class="btn btn-primary">Отфильтровать</button>
        <button class="btn btn-primary">Сбросить фильтр</button>
    </div>

    <form action="deleteContactArray" method="POST">
        <table class="table table-bordered contact-table">
            <thead>
            <tr>
                <th>
                    <label class="select-all-label">
                        <input type="checkbox" title="Выбрать"/>
                    </label>
                </th>
                <th>№</th>
                <th>Фамилия</th>
                <th>Имя</th>
                <th>Телефон</th>
                <th>Удалить</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="field" items="${contactList}" varStatus="number">
                <tr>
                    <td>
                        <label class="select-me-label">
                            <input type="checkbox" name="selected" value="${field.id}" class="select-me"/>
                        </label>
                    </td>
                    <td>
                        <c:out value="${number.count}"/>
                    </td>
                    <td>
                        <c:out value="${field.firstName}"/>
                    </td>
                    <td>
                        <c:out value="${field.lastName}"/>
                    </td>
                    <td>
                        <c:out value="${field.phone}"/>
                    </td>
                    <td>
                        <form action="deleteContact" method="POST">
                            <button type='submit' name="id"
                                    value="${field.id}" class='btn btn-primary'>Удалить
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <input type="submit" class='btn btn-primary'
               value="Удалить выбранные контакты"/>
    </form>

    <br>
    <jsp:useBean id="contactValidation" scope="request" type="ru.academits.service.ContactValidation"/>

    <label class="server-error-message-container">
        <span class="error-message">
             <c:if test="${not empty contactValidation.globalError}">
                 <c:out value="${contactValidation.globalError}">
                 </c:out>
             </c:if>
        </span>

    </label>
    <form action="add" method="POST">
        <div>
            <label class="form-label">
                <span class="form-field">Фамилия:</span>
                <input type="text" class="ml-1 form-control input-sm form-input" name="lastName"
                       value="${currentContact.lastName == null ? "" : currentContact.lastName}"/>
                <span class="error-message">
                     <c:if test="${not empty contactValidation.lastNameError}">
                         <c:out value="${contactValidation.lastNameError}">
                         </c:out>
                     </c:if>
                </span>
            </label>
        </div>
        <div>
            <label class="form-label">
                <span class="form-field">Имя:</span>
                <input type="text" class="ml-1 form-control input-sm form-input" name="firstName"
                       value="${currentContact.firstName == null ? "" : currentContact.firstName}"/>
                <span class="error-message">
                    <c:if test="${not empty contactValidation.firstNameError}">
                        <c:out value="${contactValidation.firstNameError}">
                        </c:out>
                    </c:if>
                </span>
            </label>
        </div>
        <div>
            <label class="form-label">
                <span class="form-field">Телефон:</span>
                <input type="number" class="ml-1 form-control input-sm form-input" name="phone"
                       value="${currentContact.phone == null ? "" : currentContact.phone}"/>
                <span class="error-message">
                     <c:if test="${not empty contactValidation.phoneError}">
                         <c:out value="${contactValidation.phoneError}">
                         </c:out>
                     </c:if>
                </span>
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Добавить</button>
    </form>
</div>
</body>
</html>