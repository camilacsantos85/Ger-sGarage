// Executed when the gift of the page is ready to be manipulated
$(document).ready(function () {

    // Gets the user logged in from localStorage
    const loggedInUser = JSON.parse(localStorage.getItem("garage:::session"));
    let employees = [];
    
    getEmployees();
    getLicenses();
    getMyServices();

    // Searches for html elements using jquery
    const form = $("#service-form");
    const scheduleDate = $("#schedule-date");
    const sundayAlert = $("#sunday-alert");
    const formAlert = $("#form-alert");
    const licenseSelect = $("#vehicle-license");
    const allSelects = $("#service-form select");
    const comment = $("#comment");
    const successAlert = $("#success-alert");
    const serviceType = $("#service-type");

    // Hide the elements
    sundayAlert.hide();
    formAlert.hide();
    successAlert.hide();

    // Adds an event to be executed when the form is submitted
    form.submit(function (event) {

        form.isValid = true;

        // Cancels the default behavior of the event
        event.preventDefault();

        // Validates the date
        if (!scheduleDate.val()) {

            scheduleDate.addClass("is-invalid");
            form.isValid = false;

        } else {

            scheduleDate.removeClass("is-invalid");
        }

        // Takes all elements of type select and apply validation
        allSelects.each(function (iterator, context) {

            let ctx = $(context);

            // Validates if there is value
            if (!ctx.val()) {

                ctx.addClass("is-invalid");
                form.isValid = false;
            } else {
                ctx.removeClass("is-invalid");
            }
        });

        // Validates if there is a comment
        if (!comment.val()) {

            comment.addClass("is-invalid");
            form.isValid

        } else {

            comment.removeClass("is-invalid");
        }

        // Check if the form is valid
        if (!form.isValid) {

            formAlert.show();
            return;

        } else {

            formAlert.hide();

            // Executes a post ajax request to register a user
            $.ajax({
                url: "http://localhost/ger/Service/Register",
                method: "POST",
                data: {
                    typeService: serviceType.val(),
                    userId: loggedInUser.id,
                    idVehicle: licenseSelect.val(),
                    date: scheduleDate.val()
                },
                statusCode: {
                    201: function (response) {

                        allSelects.each(function (iterator, context) {
                            $(context).val(null);
                        });

                        comment.val(null);
                        scheduleDate.val(null);
                        
                        successAlert.show();
                        successAlert.html("You have successfully booked a service.");
                        successAlert.removeClass("alert-danger");
                        successAlert.addClass("alert-success");
                    },
                    403: function (response) {
                        
                        successAlert.show();
                        successAlert.html("We are fully booked. Please select another date!");
                        successAlert.removeClass("alert-success");
                        successAlert.addClass("alert-danger");
                    }
                }
            });
        }
    });

    // Adds an event to the date when it changes value
    scheduleDate.on("change", function (event) {

        let valueData = new Date(event.target.value);
        let sunday = 0;

        // Validates if the selected date is on Sunday
        if (valueData.getDay() === sunday) {

            sundayAlert.show();
            form.isValid = false;
            $(this).addClass("is-invalid");
            event.target.value = null;

        } else {
            sundayAlert.hide();
            $(this).removeClass("is-invalid");
        }
    });

    // Adds all elements with the attribute data-service an event
    function loadServiceScript() {

        $("[data-service]").each(function (iterator, context) {

            const ctx = $(context);

            // When you click it executes this function
            ctx.on("click", function (event) {

                event.preventDefault();

                // Trigger service-details form submit 
                $("#service-id").val(ctx.data("service"));
                $("#service-details").trigger("submit");
            });
        });
    }
    
    // Gets all license plates through an ajax request
    function getLicenses() {

        $.ajax({
            type: "GET",
            url: "http://localhost/ger/Vehicle/GetByUser",
            data: {
                userId: loggedInUser.id
            },
            statusCode: {
                200: function (response) {
                    renderLicenses(JSON.parse(response));
                }
            }
        });
    }

    // Renders option type html elements through a list of license plates
    function renderLicenses(model = []) {

        const template = model.map(m => `
            <option value="${m.id}">${m.license}</option>
        `).join(' ');

        licenseSelect.html(`<option selected disabled>Select the car by license</option>${template}`);
    }

    // Searches all services of the logged in user
    function getMyServices() {

        $.ajax({
            method: "GET",
            url: `http://localhost/ger/Service/GetByUser/${loggedInUser.id}`,
            statusCode: {
                200: function (response) {

                    renderMyServices(JSON.parse(response));
                    loadServiceScript();
                }
            }
        });
        
    }

    // Renders all services in a table via a list of services
    function renderMyServices(model = []) {
        const template = model.map(m => {
        
        let employee = employees.find(item => m.idEmployee == item.id);

            console.log(employee);
        return    `
            <tr>
                <td>${m.date}</td>
                <td>${employee ? employee.name : "No allocated"}</td>
                <td>${m.license}</td>
                <td>${m.status}</td>
                <td data-service="${m.id}" class="text-center"><a class="btn btn-link" href="#">Details</a></td>
            </tr>
        `}).join(' ');

        $("#my-services-tbody").html(template);
    }

    // This function get all employees
    function getEmployees() {
        $.ajax({
            type: "GET",
            url: "http://localhost/ger/Employee/GetEmployees",
            statusCode: {
                200: function (response) {

                    employees = JSON.parse(response);
                }
            }
        });
    }
});