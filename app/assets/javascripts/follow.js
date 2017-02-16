$(function(){
  $(".js-follow").on('click', function(){
      if(confirm('本当にフォローしますか？')){
      }
      else{
        return false;
      }
  });
  $(".js-unfollow").on('click', function(){
      if(confirm('本当にフォローをやめますか？')){
      }
      else{
        return false;
      }
  });
});
