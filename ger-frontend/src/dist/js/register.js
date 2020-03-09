// Executed when the gift of the page is ready to be manipulated
$(document).ready(function () {

    // Loads html elements with jquery
    const email = $("#email");
    const name = $("#name");
    const password = $("#password");
    const confirmPassword = $("#confirm-password");
    const phone = $("#phone");
    const form = $("#register-form");
    const messageErrorContainer = $("#message-error-container");
    const alertContainer = $("#alert");

    // Hide messageErrorContainer and alertContainer
    messageErrorContainer.hide();
    alertContainer.hide();

    //  This function is used to validate that passwords are the same
    function validPasswords() {
        
        form.isValid = true;

        // Checks if they are the same
        const areEquals = password.val() === confirmPassword.val();
    
        // If not, leave the input red
        // By bootstrap4 class .is-invalid
        if (!areEquals) {
    
            password.addClass("is-invalid");
            confirmPassword.addClass("is-invalid");
            form.isValid = false;
        }
    }

    // Shows invalid user message
    function showInvalidUserMessage() {

        messageErrorContainer.show();
    }

    // Removes the is-invalid class from password inputs
    function removeIsValidClass() {
        password.removeClass("is-invalid");
        confirmPassword.removeClass("is-invalid");
    }

    // Adds an event when the form is submitted
    form.submit(function (event) {

        // Cancels default behavior
        event.preventDefault();

        validPasswords();

        if (!form.isValid) {
            showInvalidUserMessage();
            return;
        } 

        // Set data
        let data = {
            email: email.val(),
            password: password.val(),
            phone: phone.val(),
            name: name.val(),
            role: "customer"
        };

        // Executes an ajax request showing an error or success message
        // depending on the http response
        $.ajax({
            type: "POST",
            url: "http://localhost/ger/User/Register",
            data,
            statusCode: {
                404: function () {
                    
                    alertContainer.removeClass("alert-success");
                    alertContainer.addClass("alert-danger");
                    alertContainer.html();
                    alertContainer.html("An error has occurred!"); 
                    alertContainer.show();
                },
                201: function () {

                    alertContainer.removeClass("alert-danger");
                    alertContainer.addClass("alert-success");
                    alertContainer.html();
                    alertContainer.html("An user has been successfully added!"); 
                    alertContainer.show();

                    removeIsValidClass();
                    messageErrorContainer.hide();
                }
            }
        });
    });
});