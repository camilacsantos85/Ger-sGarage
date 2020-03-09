// Executed when the gift of the page is ready to be manipulated
$(document).ready(function () {

    // Get a user from localstorage database
    const loggedInUser = JSON.parse(localStorage.getItem("garage:::session"));

    // Redirect to index.html if user is not logged
    if (!loggedInUser) $(location).attr("href", "/index.html");
    
    let authorize = $("[data-authorize]");

    // Checks elements that are marked with a property [data-authorize='admin']
    // ​​and hides them if there is no permission set on the element
    authorize.each(function (iterator, context) {

        context = $(context);
        
        // get all roles in data-authorize attribute
        let ctxRoles = Array.from(context.data("authorize"));

        // If the user not logged in has one of the permissions
        if (!ctxRoles.find(role => role === loggedInUser.role)) {
            
            // hide element
            context.hide();

            // Show message error if exists
            $(`[data-authorize-alert='${context.data("authorize-alert-for")}']`).show();
        } else {

            // Hide message error
            $(`[data-authorize-alert='${context.data("authorize-alert-for")}']`).hide();
        }
    });
    
});