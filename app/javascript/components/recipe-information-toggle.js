function recipeInformationToggle() {
const recipeImg = document.querySelectorAll(".dish-image");

  $(".dish-image").hover(function () {
    if ($(".info-card").hasClass("slideup"))
      $(".info-card").removeClass("slideup").addClass("slidedown");
    else
      $(".info-card").removeClass("slidedown").addClass("slideup");
  });
};
export { recipeInformationToggle };


