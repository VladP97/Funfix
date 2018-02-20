$(document).ready(function () {
    $(document).on("click", ".chapters", function() {
        window.location = "http://localhost:3000" + $(this).data("href");
    });
});
