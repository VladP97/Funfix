$(document).ready(function() {
    $('.table-hover').DataTable({
        responsive: true
    });

    $(document).on("click", "tbody > tr > td", function() {
        window.location = "http://localhost:3000" + $(this).data("href");
    });

    $(document).on("click", "tfoot > tr > td", function () {
        window.location = $(this).data("href");
    })
});