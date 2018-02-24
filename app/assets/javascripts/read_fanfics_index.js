var toggleClasses = function () {
    $('.badge').click(function () {
        $(this).toggleClass('badge-secondary badge-primary');
    });
};

var tagsSearchAll = function () {
    $('#tags-search-all').click(function () {
        var tagsArray = [];
        $('.badge-primary').each(function (index, elem) {
            tagsArray.push(elem.textContent);
        });
        var urlParams = $.param({page: 1, tags: tagsArray, search: 'search_all'});
        window.location = '/read_fanfics?' + urlParams;
    });
};

var tagsSearchAny = function () {
    $('#tags-search-any').click(function () {
        var tagsArray = [];
        $('.badge-primary').each(function (index, elem) {
            tagsArray.push(elem.textContent);
        });
        var urlParams = $.param({page: 1, tags: tagsArray, search: 'search_any'});
        window.location = '/read_fanfics?' + urlParams;
    });
};

var showTags = function () {
    $('#show-tags').click(function () {
        $.ajax({
            url: '/tags/get_all',
            method: 'get',
            success: function (response) {
                $('.tag-cloud').html(response);
                toggleClasses();
                tagsSearchAll();
                tagsSearchAny();
                hideTags();
            }
        });
    });
};

var hideTags = function () {
    $('#hide-tags').click(function () {
        $.ajax({
            url: '/tags/hide_all',
            method: 'get',
            success: function (response) {
                $('.tag-cloud').html(response);
                toggleClasses();
                tagsSearchAll();
                tagsSearchAny();
                showTags();
            }
        });
    });
};

$(document).ready(function () {
    toggleClasses();

    tagsSearchAll();

    tagsSearchAny();

    showTags();
});