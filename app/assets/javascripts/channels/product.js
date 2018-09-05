App.product = App.cable.subscriptions.create("ProductChannel", {
    connected: function() {
        // Called when the subscription is ready for use on the server
        this.listen_to_comments();
    },

    disconnected: function() {
        // Called when the subscription has been terminated by the server
    },

    received: function(data) {
        // Called when there's incoming data on the websocket for this channel
        $(".alert.alert-info").show();
        $('.product-reviews').prepend(data.comment);
        $("#average-rating").attr('data-score', data.average_rating);
        refreshRating();
    },
    //We want to access the product_id 
    //We will call this method when a user opens the page.
    listen_to_comments: function() {
        return this.perform('listen', {
            product_id: $("[data-product-id]").data("product-id")
        });
    }
});
//We need to make sure the listen_to_comments is called
//every single time the user loads a new page
$(document).on('turbolinks:load', function() {
    App.product.listen_to_comments();
});