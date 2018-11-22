function recipeInformationToggle() {
const recipeImg = document.querySelectorAll(".dish-image");

  $(".dish-image").hover(function () {
    $(".info-card").toggleClass("open");
  });
};
export { recipeInformationToggle };


