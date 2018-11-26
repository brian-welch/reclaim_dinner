function recipeLockButtonAction() {
  $(".index-single-recipe-lock-button").click(function(){
    $(this).toggleClass("lock-button-locked");
    $(this).html($(this).html() == '<i class="fas fa-lock-open"></i>' ? '<i class="fas fa-lock"></i>' : '<i class="fas fa-lock-open"></i>');
  });
};

export { recipeLockButtonAction };
