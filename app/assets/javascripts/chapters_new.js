$(document).ready(function () {
    var markdownSettings;

    markdownSettings = {
        previewParserPath: '/markdown/preview',
        onShiftEnter: {
            keepDefault: false,
            openWith: '\n\n'
        },
        markupSet: [
            {
                name: 'First Level Heading',
                key: '1',
                openWith: '# ',
                placeHolder: 'Your title here...',
            }, {
                name: 'Second Level Heading',
                key: '2',
                openWith: '## ',
                placeHolder: 'Your title here...',
            }, {
                name: 'Heading 3',
                key: '3',
                openWith: '### ',
                placeHolder: 'Your title here...'
            }, {
                name: 'Heading 4',
                key: '4',
                openWith: '#### ',
                placeHolder: 'Your title here...'
            }, {
                name: 'Heading 5',
                key: '5',
                openWith: '##### ',
                placeHolder: 'Your title here...'
            }, {
                name: 'Heading 6',
                key: '6',
                openWith: '###### ',
                placeHolder: 'Your title here...'
            }, {
                separator: '---------------'
            }, {
                name: 'Bold',
                key: 'B',
                openWith: '**',
                closeWith: '**'
            }, {
                name: 'Italic',
                key: 'I',
                openWith: '_',
                closeWith: '_'
            }, {
                separator: '---------------'
            }, {
                name: 'Bulleted List',
                openWith: '- '
            }, {
                name: 'Numeric List',
            }, {
                separator: '---------------'
            }, {
                name: 'Link',
                key: 'L',
                openWith: '[',
                closeWith: ']([![Url:!:http://]!] "[![Title]!]")',
                placeHolder: 'Your text to link here...'
            }, {
                separator: '---------------'
            }, {
                name: 'Quotes',
                openWith: '> '
            }, {
                name: 'Code Block / Code',
                openWith: '(!(\t|!|`)!)',
                closeWith: '(!(`)!)'
            }, {
                separator: '---------------'
            }
        ]
    };

    $("textarea").markItUp(markdownSettings);

    $(function() {
        if($.fn.cloudinary_fileupload !== undefined) {
            $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
        }
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
        $('.image').attr('value', response.url);
    });
});