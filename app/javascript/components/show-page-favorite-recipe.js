function showRecipeToggleFavorite() {
  $(".show-recipe-favorite-button").click(function(){
    $(this).toggleClass("show-recipe-active-favorite-recipe");
  });
};
export { showRecipeToggleFavorite };
