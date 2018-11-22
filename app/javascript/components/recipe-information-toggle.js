function recipeInformationToggle() {
const recipeImg = document.querySelectorAll(".dish-image");

  $(".dish-image, .info-card").hover(function () {
    $(".info-card").toggleClass("open");
  });
};
export { recipeInformationToggle };



