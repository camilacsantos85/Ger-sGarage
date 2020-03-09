// Executed when the gift of the page is ready to be manipulated
$(document).ready(function () {

    // Load html elements via JQuery
    const form = $("#vehicle-form");
    const type = $("#vehicle-type");
    const brand = $("#vehicle-brand");
    const license = $("#vehicle-license");
    const motor = $("#vehicle-motor");
    const formAlert = $("#form-alert");

    // Load the logged in user from localStorage
    let loggedInUser = JSON.parse(localStorage.getItem("garage:::session"));

    getVehicles();

    // Adds an action when the form is submitted
    form.submit(function (event) {

        event.preventDefault();

        // Removes validation css from all elements
        removeIsInvalidClass();

        // Validates all form elements
        validFields();

        // Checks whether the form is valid
        if (!form.isValid) return;

        // Set data
        let data = {
            type: type.val(),
            brand: brand.val(),
            motor: motor.val(),
            license: license.val(),
            userId: loggedInUser.id
        }

        // Executes an ajax request if the form is valid to register a vehicle
        $.ajax({
            type: "POST",
            url: "http://localhost/ger/vehicle/Register",
            data,
            statusCode: {
                404: function () {

                    console.warn('statusCode: 404 -> POST to /ger/vehicle/Register');
                    
                    formAlert.removeClass("alert-success");
                    formAlert.addClass("alert-danger");
                    formAlert.html();
                    formAlert.html("Error ;(");
                    formAlert.show();
                },
                201: function () {

                    formAlert.removeClass("alert-danger");
                    formAlert.addClass("alert-success");
                    formAlert.html();
                    formAlert.html("Your car has been successfully added.");
                    formAlert.show();

                    removeIsInvalidClass();
                    getVehicles();
                }
            }
        });

    });

    // Get all vehicles from service using ajax request
    function getVehicles() {
        $.ajax({
            type: "GET",
            url: "http://localhost/ger/vehicle/GetByUser",
            data: {
                userId: loggedInUser.id
            },
            statusCode: {
                200: function (response) {
                    
                    let parse = JSON.parse(response);

                    if (Array.isArray(parse)) {

                        rendervehicles(parse);    
                    } else {

                        rendervehicles([parse]);
                    }
                }
            }
        });
    }

    // Render all vehicles in table rows and insert them using JQuery
    function rendervehicles(model = []) {

        const template = model.map(m => `

            <tr>
                <td>${m.id}</td>
                <td>${m.type}</td>
                <td>${m.brand}</td>
                <td>${m.license}</td>
                <td>${m.motor}</td>
            </tr>
        
        `).join(' ');

        $("#vehicle-tbody").html(template);
        
    }

    // Remove .is-invalid css class from inputs and selects
    function removeIsInvalidClass() {
        $("input").each(function (iterator, context) {

            $(context).removeClass("is-invalid");
        });

        $("select").each(function (iterator, context) {

            $(context).removeClass("is-invalid");
        });
    }

    // Valid inputs and selects form fields
    function validFields() {
        form.isValid = true;

        $("input").each(function (iterator, context) {

            const ctx = $(context);
            
            if (!ctx.val()) {
                ctx.addClass("is-invalid");
                form.isValid = false; 
            }
        });

        $("select").each(function (iterator, context) {
            
            const ctx = $(context);

            if (!ctx.val()) {
                
                form.isValid = false;
                ctx.addClass("is-invalid");
            }
        });
    }
});