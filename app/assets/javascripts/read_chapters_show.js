var animation = function () {
    $('.rate').mouseenter(function () {
        $(this).prevAll().find('svg').css({'color': '#1c1c1c'});
        $(this).find('svg').css({'color': '#1c1c1c'})
    });
    $('.rate').mouseleave(function () {
        $(this).prevAll().find('svg').css({'color': '#b4b4b4'});
        $(this).find('svg').css({'color': '#b4b4b4'})
    });
};
$(document).ready(function () {
    animation();

    $(document).on("click", ".rate", function() {
        $.ajax({
            method: 'post',
            url: '/ratings',
            data: {
                chapter: $(this).attr('chapter'),
                rating: $(this).attr('rating')
            },
            success: function (response) {
                $('.rating').html(response);
                animation();
            }
        });
    });

    $('.comments > form').bind('ajax:complete', function() {
        $('.comments > form > textarea').val('');
    });
});