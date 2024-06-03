<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
                <script src="/js/getCityDistrictWard.js"></script>
            </head>

            <body>
                <div class="container-fluid  px-4">
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <form:form class="row" method="post" action="/admin/user/create" modelAttribute="user">

                                    <h2>Create a user</h2>

                                    <div class="mb-3 col-12 col-md-6">
                                        <c:set var="nameError">
                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Full name<span style="color: red;">*</span> :</label>
                                        <form:input type="text"
                                            class="form-control ${not empty nameError?'is-invalid':''}"
                                            path="fullName" />
                                        ${nameError}
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <c:set var="emailError">
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Email address<span style="color: red;">*</span>
                                            :</label>
                                        <form:input type="email"
                                            class="form-control ${not empty emailError ? 'is-invalid' : ''}"
                                            path="email" />
                                        ${emailError}
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <c:set var="passwordError">
                                            <form:errors path="password" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Password<span style="color: red;">*</span> :</label>
                                        <form:input type="password"
                                            class="form-control ${not empty passwordError ? 'is-invalid' : ''}"
                                            path="password" />
                                        ${passwordError}
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Confirm Password<span style="color: red;">*</span>
                                            :</label>
                                        <input type="password" class="form-control">
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <c:set var="phoneError">
                                            <form:errors path="phone" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Phone<span style="color: red;">*</span> :</label>
                                        <form:input type="text"
                                            class="form-control ${not empty phoneError ? 'is-invalid' : ''}"
                                            path="phone" />
                                        ${phoneError}
                                    </div>

                                    <fieldset class="mb-3 col-12 col-md-6">
                                        <legend class="col-form-label col-sm-3 pt-0">Gender<span
                                                style="color: red;">*</span> :</legend>
                                        <div class="col-sm-10">
                                            <div class="form-check form-check-inline">
                                                <form:radiobutton class="form-check-input" name="gridRadios"
                                                    id="gridRadios1" value="1" path="gender" checked="checked" />
                                                <label class="form-check-label" for="gridRadios1">
                                                    Male
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <form:radiobutton class="form-check-input" name="gridRadios"
                                                    id="gridRadios2" value="2" path="gender" />
                                                <label class="form-check-label" for="gridRadios2">
                                                    Female
                                                </label>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <div class="mb-3 col-12 col-md-6">
                                        <c:set var="birthDayError">
                                            <form:errors path="birthDay" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Birthday<span style="color: red;">*</span> :</label>
                                        <form:input type="date"
                                            class="form-control ${not empty birthDayError ? 'is-invalid' : ''}"
                                            path="birthDay" />
                                        ${birthDayError}
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <c:set var="cityError">
                                            <form:errors path="city" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Tỉnh/Thành phố<span style="color: red;">*</span>
                                            :</label>
                                        <form:select
                                            class="form-control form-select ${not empty cityError ? 'is-invalid' : ''}"
                                            id="city" aria-label=".form-select-sm" path="city">
                                            <option value="" selected="selected">Chọn tỉnh/thành phố</option>
                                        </form:select>
                                        ${cityError}
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <c:set var="districtError">
                                            <form:errors path="district" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Quận/Huyện<span style="color: red;">*</span> :</label>
                                        <form:select
                                            class="form-control form-select ${not empty districtError ? 'is-invalid' : ''}"
                                            id="district" aria-label=".form-select-sm" path="district">
                                            <option value="" selected="selected">Chọn quận/huyện</option>
                                        </form:select>
                                        ${districtError}
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <c:set var="wardError">
                                            <form:errors path="ward" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Xã/Phường<span style="color: red;">*</span> :</label>
                                        <form:select
                                            class="form-control form-select ${not empty wardError ? 'is-invalid' : ''}"
                                            id="ward" aria-label=".form-select-sm" path="ward">
                                            <option value="" selected="selected">Chọn xã/phường</option>
                                        </form:select>
                                        ${wardError}
                                    </div>
                                    <div class="mb-3 col-12">
                                        <label class="form-label">Địa chỉ (số nhà, tên đường):</label>
                                        <form:input type="text" class="form-control" path="address" />
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>