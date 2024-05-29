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
                                        <label class="form-label">Full Name:</label>
                                        <form:input type="text" class="form-control" path="fullName" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Email address:</label>
                                        <form:input type="email" class="form-control" path="email" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Password:</label>
                                        <form:input type="password" class="form-control" path="password" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Confirm Password:</label>
                                        <input type="password" class="form-control">
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Phone:</label>
                                        <form:input type="text" class="form-control" path="phone" />
                                    </div>

                                    <fieldset class="mb-3 col-12 col-md-6">
                                        <legend class="col-form-label col-sm-2 pt-0">Gender:</legend>
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
                                        <label class="form-label">Birthday:</label>
                                        <form:input type="date" class="form-control" path="birthDay" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Tỉnh/Thành phố:</label>
                                        <form:select class="form-control form-select" id="city"
                                            aria-label=".form-select-sm" path="city">
                                            <option value="" selected="selected">Chọn tỉnh/thành phố</option>
                                        </form:select>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Quận/Huyện:</label>
                                        <form:select class="form-control form-select" id="district"
                                            aria-label=".form-select-sm" path="district">
                                            <option value="" selected="selected">Chọn quận/huyện</option>
                                        </form:select>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Xã/Phường:</label>
                                        <form:select class="form-control form-select" id="ward"
                                            aria-label=".form-select-sm" path="ward">
                                            <option value="" selected="selected">Chọn xã/phường</option>
                                        </form:select>
                                    </div>
                                    <div class="mb-3 col-12">
                                        <label class="form-label">Address:</label>
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