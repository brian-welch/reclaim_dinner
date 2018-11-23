function recipeInformationToggle() {
const recipeImg = document.querySelectorAll(".dish-image");

$(".dish-image, .info-card").hover(function () {
    card_id_number = $(this).attr("id").replace("dish-","");
    // $(".info-card").toggleClass("open");
    $("#info_card-".card_id_number).toggleClass("open");
  });
};
export { recipeInformationToggle };



