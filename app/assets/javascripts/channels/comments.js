App.comments = App.cable.subscriptions.create("CommentsChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
        return $('#comments').append(this.renderComment(data));
    },

    renderComment: function(data) {
        return "<p><b>" + data.user + ":</b>" + data.message + "</p>";
    }
});
