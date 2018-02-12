App.comments = App.cable.subscriptions.create("CommentsChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
        var isExist = false;
        console.log(data);
        $('div[comment-id]').toArray().map(function(e) {
            if(e.getAttribute('comment-id') == data.id){
                isExist = true;
                return $("div[comment-id=" + data.id + "] > div > div").text(data.likes + ' ');
            }
        });
        if(!isExist) {
            $('#comments').append(this.renderComment(data));
        }
    },

    renderComment: function(data) {
        return "<div comment-id="+ data.id +">" +
            "<p><strong>"+ data.user +": </strong>"+ data.message +"</p>" +
            "<div class='likes'>" +
            "<div class='counts'>"+ data.likes +" </div>" +
            "<a authenticity_token=\"true\" data-remote=\"true\" rel=\"nofollow\" data-method=\"patch\" href=\"/comments/"+ data.id +"\">" +
            "<i class='far fa-thumbs-up'></i>" +
            "</a>" +
            "</div>" +
            "</div>" +
            "<hr>"
    }
});
