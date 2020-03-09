// Executed when the gift of the page is ready to be manipulated
$(document).ready(function () {

    // Get employees
    let employees = [];
    getEmployees();

    // Load all elements with JQuery
    const name = $("#name");
    const phone = $("#phone");
    const formAlert = $("#form-alert");
    const selectDate = $("#select-date"); 
    const form = $("#employee-form");
    const alertSuday = $("#alert-sunday");

    // Hide the alert
    alertSuday.hide();

    // Defines an event when the form is submitted
    form.submit(function (event) {

        // Prevents standard event behavior
        event.preventDefault();

        // Set data
        let data = {
            name: name.val(),
            phone: phone.val()
        }

        // Performs an ajax request to register an employee
        $.ajax({
            type: "POST",
            url: "http://localhost/ger/Employee/RegisterEmployee",
            data,
            statusCode: {
                401: function () {

                    console.warn('statusCode: 401 -> POST to /ger/Employee/RegisterEmployee');
                    // Show error alert
                    messageErrorContainer.show();

                    // Hide success alert
                    formAlert.removeClass("alert-success");
                    formAlert.hide();
                },
                201: function (token) {

                    getEmployees();
                    // Show success alert
                    formAlert.addClass("alert-success");
                    formAlert.html("An employee has been successfully added!"); 
                    formAlert.show();
                    
                    // Reset the form
                    name.val("");
                    phone.val("");
                }
            }
        });
    });

    // Adds an event when the user changes the value of the select element
    selectDate.on("change", function (event) {

        event.preventDefault();

        let valueDate = new Date(event.target.value);
        let sunday = 0;

        // If it's Sunday
        if (valueDate.getDay() == sunday) {

            // Show alert
            alertSuday.show();
            event.target.value = null;

        } else {

            // Hide alert
            alertSuday.hide();
            getByDate(event.target.value);
        }

    });

    // Search all services by the given date
    function getByDate(date) {

        $.ajax({
            type: "GET",
            url: `http://localhost/ger/Service/GetByDate/${date}`,
            statusCode: {
                200: function (response) {
                    renderServicesByDate(JSON.parse(response));
                }
            }
        });
    }

    // Render the services in a html table receiving a list of services
    function renderServicesByDate(model = []) {
        
        const template = model.map(schedule => {
            
        
            let employee = employees.find(emp => emp.id == schedule.idEmployee);
        return `
        <tr>
            <td>${schedule.id}</td>
            <td>${schedule.date}</td>
            <td>${schedule.typeService}</td>
            ${ employee  ?
            `<td>${employee.name}</td>` :
            `<td>No allocated</td>`}
            <td>${schedule.status}</td>
            <td class="text-center"><a href="#" data-service="${schedule.id}" class="btn btn-link">Details</a></td>
        </tr>

        `}).join(' ');
        
        $("#admin-service-tbody").html(template);
        loadServiceScript();
    }

    // This function adds an event to each element with the data-service attribute and when it is clicked,
    // a redirection is made to the details page using the service id
    function loadServiceScript() {

        //  Get all elements with the attribute [data-service]
        // By example: <button data-service></button>
        $("[data-service]").each(function (iterator, context) {

            const ctx = $(context);

            // Add event
            ctx.on("click", function (event) {

                event.preventDefault();

                // Trigger submit
                $("#service-id").val(ctx.data("service"));
                $("#service-details").trigger("submit");
            });
        });
    }

    // This function searches for all employees using ajax
    function getEmployees() {
        $.ajax({
            type: "GET",
            url: "http://localhost/ger/Employee/GetEmployees",
            statusCode: {
                200: function (response) {
                    employees = JSON.parse(response);
                    renderEmployeeTable(employees);
                }
            }
        });
    }

    // This function generates rows from an html table and adds them to the body of the table
    function renderEmployeeTable(model = []) {

        let template = model.map(m => `
        <tr>    
            <td>${m.id}</td>
            <td>${m.name}</td>
            <td>${m.phone}</td>
        </tr>`
        ).join(' ');

        $("#employee-tbody").html(template);
    }
});