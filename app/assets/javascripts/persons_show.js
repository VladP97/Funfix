$(document).ready(function() {
    $('.table-hover').DataTable({
        responsive: true
    });

    $(document).on("click", "tbody > tr > td", function() {
        console.log(this);
        window.location = "http://localhost:3000" + $(this).data("href");
    });
});