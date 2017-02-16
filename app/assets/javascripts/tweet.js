$(function(){

  function buildHTML(tweet) {

      var html = (
        '<div class="tweet">' +
          '<div class="tweet__account-name">' +
            '<a href="/users/'+ tweet.user_id +'" class:"nickname"> ' +
              tweet.user_nickname +
            '</a>' +
            '@' +
            tweet.username +
          '</div>' +
          '<div class="tweet__body">' +
            tweet.body +
            '<div class="like_buttons" id="tweets_<%= tweet.id %>">' +
              // '<%= render partial: "likes/like", locals:{tweet: tweet} %>' +
            '</div>' +
          '</div>' +
          '<div class="tweet__time">' +
            tweet.created_at +
          '</div>' +
          '<div class="tweet__right-button">' +
            // '<% if tweet.user == current_user %>' +
              // '<%= link_to tweet_path(tweet), method: :delete do %>' +
              // '<a href="/tweets/'+ tweet.id +'/likes/'+ tweet.like +'" method: :delete> ' +
                '<i class="fa fa-trash-o"></i>' +
              // '</a>' +
              // '<% end %>' +
            // '<% else %>' +
              // "<%= j(render partial: 'users/follow_form', locals: {user: tweet.user} ) %>" +
            // '<% end %>' +
          '</div>' +
        '</div>'
      );
    return html;
  };

  // setInterval(function() {
  //   $.ajax({
  //     url: '.',
  //     type: 'get',
  //     dataType: 'json'
  //   })
  //   .done(function(data){
  //     $('.tweets').empty();
  //     $.each(data,function(num, tweet){
  //       var html = buildHTML(tweet);
  //       $('.tweets').append(html);
  //     });
  //   });
  // },5000);

  $(".fa-trash-o").on('click', function(){
    if(confirm('本当に削除しますか？')){
    }
    else{
      return false;
    }
  });
});
