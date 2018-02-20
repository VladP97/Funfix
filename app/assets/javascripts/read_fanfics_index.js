$(document).ready(function () {
    $('.badge').click(function () {
        $(this).toggleClass('badge-secondary badge-primary');
    });

    $('#tags-search-all').click(function () {
        var tagsArray = [];
        $('.badge-primary').each(function (index, elem) {
            tagsArray.push(elem.textContent);
        });
        var urlParams = $.param({page: 1, tags: tagsArray, search: 'search_all'});
        window.location = '/read_fanfics?' + urlParams;
    });


    $('#tags-search-any').click(function () {
        var tagsArray = [];
        $('.badge-primary').each(function (index, elem) {
            tagsArray.push(elem.textContent);
        });
        var urlParams = $.param({page: 1, tags: tagsArray, search: 'search_any'});
        window.location = '/read_fanfics?' + urlParams;
    });
});