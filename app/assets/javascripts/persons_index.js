$(document).ready(function () {
    $(document).on("click", "tbody > tr > td", function() {
        window.location = "http://localhost:3000" + $(this).data("href");
    });
});