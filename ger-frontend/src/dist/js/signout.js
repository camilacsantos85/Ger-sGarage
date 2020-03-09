// Executed when the gift of the page is ready to be manipulated
$(document).ready(function () {
    
    // Adds an event when the button with id sign-out is clicked
    $("#sign-out").click(function (event) {
        
        event.preventDefault();

        // Remove loggedInUser from localStorage
        localStorage.removeItem("garage:::session");

        // Redirect to index.html page
        $(location).attr("href", "/index.html");
    });
});