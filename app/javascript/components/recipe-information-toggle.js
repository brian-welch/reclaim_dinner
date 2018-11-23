function recipeInformationToggle() {
const recipeImg = document.querySelectorAll(".dish-image");


  $(".dish-image, .info-card").hover(function () {

    var num = $(this).attr("id").replace("dish-","");

    var card_id = "info_card-" + num;

    $("#" + card_id).toggleClass("open");
  });
};
export { recipeInformationToggle };



