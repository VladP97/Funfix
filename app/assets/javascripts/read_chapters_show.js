$(document).ready(function () {
    $(document).on("click", ".rate", function() {
        window.location = "http://localhost:3000" + $(this).data("href");
    });
    $('.rate').mouseenter(function () {
        $(this).prevAll().find('svg').css({'color': '#1c1c1c'});
        $(this).find('svg').css({'color': '#1c1c1c'})
    });
    $('.rate').mouseleave(function () {
        $(this).prevAll().find('svg').css({'color': '#b4b4b4'});
        $(this).find('svg').css({'color': '#b4b4b4'})
    });
});