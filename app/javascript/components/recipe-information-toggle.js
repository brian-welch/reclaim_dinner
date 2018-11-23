function recipeInformationToggle() {
const recipeImg = document.querySelectorAll(".dish-image");

  $(".dish-image, .recipe-detail-block-outer").hover(function () {
    $(".recipe-detail-block-outer").toggleClass("open");
  });
};
export { recipeInformationToggle };



