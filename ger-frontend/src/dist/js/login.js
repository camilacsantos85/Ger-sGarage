// This function execute when the web page is load
// use JQuery ready function
$(document).ready(function () {
    
    const email = $("#email");
    const password = $("#password");
    const messageErrorContainer = $("#message-error-container");
    const form = $("#form-login");

    messageErrorContainer.hide();

    form.submit(function (event) {
        
        event.preventDefault();

        let data = { 
            email: email.val(),
            password: password.val()
        };

        messageErrorContainer.hide();

        // Valid if email and password exists
        if (data.email && data.password) {
            removeClassIsValid();

            $.ajax({
                type: "POST",
                url: "http://localhost/ger/Auth/Login",
                data,
                statusCode: {
                    401: function () {
                        
                        console.warn('statusCode: 401 -> POST to /ger/Admin/Login');
                        messageErrorContainer.show();
                    },
                    200: function (token) {

                        localStorage.setItem("garage:::session", token);

                        $(location).attr('href', '/pages/main.html')
                    }
                }
            });
        } else {
            
            removeClassIsValid();
            addClassIsValidIfNecessary();
        }
    });

    // Add class name is-invalid if input is empty
    function addClassIsValidIfNecessary() {
        if (!email.val())
            email.addClass("is-invalid");
        if (!password.val())
            password.addClass("is-invalid");
    }

    // Remove class name is-invalid from all input
    function removeClassIsValid() {
        $("input").each(function (iterator, context) {
            $(context).removeClass("is-invalid");
        });
    }
});