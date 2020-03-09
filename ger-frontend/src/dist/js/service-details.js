$(document).ready(function () {

    const loggedInUser = JSON.parse(localStorage.getItem("garage:::session"));
    
    // get parameter service_id from url
    let searchParams = new URLSearchParams(window.location.search);
    const serviceId = searchParams.get("service_id");

    let products = [];
    let serviceProducts = [];
    let service = {};
    let employees = [];

    // hide div alert
    $("#form-alert").hide();

    // if not exist serviceId redirect to index.html
    if (!serviceId)
        $(location).attr("href", "/index.html");

    getProducts();
    getProductsFromServiceId();

    // this http request get uses ajax to get a service by id
    $.ajax({
        type: "GET",
        url: `http://localhost/ger/Service/Get/${serviceId}`,
        // this success callback function set elements of ui with service object received from
        // request
        success: function (response) {

            service = JSON.parse(response);

            $("#vehicle-type").html(`<option selected>${service.typeService}</option>`);
            $("#vehicle-brand").val(service.brand);
            $("#vehicle-license").val(service.license);
            $("#vehicle-motor").html(`<option selected>${service.motor}</option>`);
            $("#service-cost").val(service.cost || 0.00);
            
            if (loggedInUser.role == "customer") {

                $("#vehicle-service-status").html(`<option selected>${service.status}</option>`);
                $("#vehicle-service-status").attr("disabled", "disabled");
                $("#service-cost").attr("disabled", "disabled");
                $("#service-employee").attr("disabled", "disabled");
            }

            getEmployees();
        }
    });

    // return an string as html
    // elements <option></option>
    function getEmployeeTemplate() {
        return employees.map(item => `
            <option value="${item.id}">${item.name}</option>
        `).join(' ');
    }

    // this function get employee from server using ajax
    // and render html from JQuery
    function getEmployees() {

        $.ajax({
            type: "GET",
            url: "http://localhost/ger/Employee/GetEmployees",
            statusCode: {
                200: function (response) {
                    
                    employees = JSON.parse(response);

                    let employee = employees.find(item => service.idEmployee == item.id);

                    if (employee) {
                        $("#service-employee").html(`<option selected value="${employee.id}">${employee.name}</option>` + 
                            getEmployeeTemplate(employees)
                        );
                    } else {

                        $("#service-employee").html(getEmployeeTemplate(employees));
                    }
                }
            }
        });
    }
        
    // This line code listen the button and when clicked call the saveStatusAndCost function
    $("#save-status-cost").click(updateService);

    // This function update a service
    function updateService() {

        $.ajax({
            type: "POST",
            url: "http://localhost/ger/Service/UpdateService",
            data: {
                newStatus: $("#vehicle-service-status").val(),
                serviceId,
                cost: $("#service-cost").val(),
                idEmployee: $("#service-employee").val()
            },
            success: function (response) {

                $("#form-alert").html("Service updated successfully.");
                $("#form-alert").show();
            }
        });
    }

    // This function render a template html and insert into element with id product-select
    function renderProducts(model = []) {

        const template = model.map(m => `

            <option value="${m.id}">${m.name}</option>
        `).join(' ');

        $("#product-select").html(`<option disabled selected>Select the new product</option> ${template}`);
    }

    // This function get the products to render in select element
    // The admin choose a product and add
    async function getProducts() {
        $.ajax({
            type: "GET",
            url: "http://localhost/ger/Product/Get",
            statusCode: {
                200: function (response) {
                    products = JSON.parse(response);
                    renderProducts(products);
                }
            }
        });
    }

    // This function find a product by id in array
    function getProductById(id) {

        return products.find(item => item.id == id);
    }

    // This function gets all products by service id
    // This function uses ajax to request
    // And uses the function renderServicesProduct to render the products on table
    function getProductsFromServiceId() {
        
        $.ajax({
            type: "GET",
            url: `http://localhost/ger/ServiceProduct/GetByServiceId/${serviceId}`,
            success: function (response) {

                let serviceProducts = JSON.parse(response);


                serviceProducts = serviceProducts.map(item => {

                    let product = getProductById(item.productId);
                    
                    if (!product) {
                        getProductsFromServiceId();
                    }

                    return {
                        name: product.name,
                        cost: item.cost,
                        description: product.description,
                        quantity: item.quantity
                    }
                });


                renderServicesProduct(serviceProducts);
            }
        });
    }

    // This function renders the products on table
    function renderServicesProduct(model = []) {

        const template = model.map(m => {

            serviceProducts.push(m);

            return `<tr>
                <td>${m.name}</td>
                <td>${m.description}</td>
                <td p-cost >${m.cost}</td>
                <td>${m.quantity}</td>
            </tr>
        
        `}).join(' ');

        $("#service-products-tbody").html(template);
    }

    // This function uses JQuery to listen the clic event
    // On element with id add-new-product and execute
    // A POST request to server
    $("#add-new-product").click(function (event) {

        event.preventDefault();

        const quantity = $("#product-quantity").val();
        const productId = $("#product-select").val();

        $.ajax({
            type: "POST",
            url: "http://localhost/ger/ServiceProduct/Add",
            data: {
                serviceId,
                productId,
                quantity
            },
            success: function () {
                getProductsFromServiceId();
            }
        });
    });

    // Adds an action when the customer clicks the button to generate a report
    $("#generate-a-report").click(function () {
        
        $.ajax({
            method: "GET",
            url: `http://localhost/ger/User/GetById/${service.idCustomer}`,
            success: function (response) {

                const customer = JSON.parse(response);

                let productsCost = [];

                $("[p-cost]").each(function (iterator, context) {
                    productsCost.push(parseFloat($(context).html())); 
                });
        
                $("#customer-name").html(customer.name);
                $("#customer-phone").html(customer.phone);
                $("#license").html(service.license);
                $("#service-type").html(service.typeService);
                $("#service-type-cost").html(parseFloat(service.cost).toFixed(2));

                const allProducts = productsCost.reduce((a, b) => a + b, 0.00).toFixed(2);
                $("#product-cost").html(allProducts);

                $("#total").html(parseFloat(allProducts) + parseFloat(service.cost));
                print();
            }
        });
    });
});

