function recipeLockButtonAction() {
  $(".index-single-recipe-lock-button").click(function(){
    if ($(this)[0].parentElement.dataset.locked === "false") {
      $(this)[0].parentElement.dataset.locked = "true";
    } else if ($(this)[0].parentElement.dataset.locked === "true") {
      $(this)[0].parentElement.dataset.locked = "false";
    }
    $(this).toggleClass("lock-button-locked");
    $(this).html($(this).html() == '<i class="fas fa-lock-open"></i>' ? '<i class="fas fa-lock"></i>' : '<i class="fas fa-lock-open"></i>');
  });
};

window.recipeLockButtonAction = recipeLockButtonAction

export { recipeLockButtonAction };
