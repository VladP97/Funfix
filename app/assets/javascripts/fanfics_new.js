$(document).ready(function () {
    $(function() {
        if($.fn.cloudinary_fileupload !== undefined) {
            $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
        }

        var ms = $('#magicsuggest').magicSuggest();
        $.ajax({
            url: '/tags',
            method: 'get',
            success: function (response) {
                ms.setData(response.tags);
            }
        });
        $(ms).on('selectionchange', function (e,m) {
            console.log();
            $('#fanfic_tags').attr('value', m.getSelection().map(function (obj) { return obj.name }).join(' '));
        });
    });

    var myDropzone = new Dropzone(document.getElementById('dropzone-area'), {
        uploadMultiple: false,
        acceptedFiles:'.jpg,.png,.jpeg,.gif',
        parallelUploads: 6,
        url: 'https://api.cloudinary.com/v1_1/dhpelms3i/auto/upload'
    });
    myDropzone.on('sending', function (file, xhr, formData) {
        formData.append('api_key', 665566686966281);
        formData.append('timestamp', Date.now() / 1000 | 0);
        formData.append('upload_preset', 'x9mghqma');
    });
    myDropzone.on('success', function (file, response) {
        $('.image').attr('value', response.public_id);
    });
});