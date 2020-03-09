// Executed when the gift of the page is ready to be manipulated
$(document).ready(function () {
    
    getOurProducts();

    // Searches all products for ajax requisition
    function getOurProducts() {
        $.ajax({
            type: "GET",
            url: "http://localhost/ger/Product/Get",
            statusCode: {
                200: function (response) {
                    
                    renderProducts(JSON.parse(response));
                }
            }
        });
    }

    // Generates rows of html tables with a list of products
    // and renders in the body of the table
    function renderProducts(model = []) {
        const template = model.map(m => `
            <tr>
                <td>${m.id}</td>
                <td>${m.name}</td>
                <td>${m.cost}</td>
                <td>${m.description}</td>
            </tr>
        
        `).join(' ');

        $("#products-tbody").html(template);
    }
});