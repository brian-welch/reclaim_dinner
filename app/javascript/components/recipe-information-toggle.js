function recipeInformationToggle() {
const recipeImg = document.querySelectorAll(".dish-image");


  $(".dish-image, .recipe-detail-block-outer, .recipe-detail-block-inner, .recipe-detail-photo-box, .recipe-detail-info-box, .recipe-detail-info-name, .recipe-detail-info-specs ").hover(function () {

    // var num = $(this).attr("id").replace("dish-","");

    var card_id = "info_card-" + $(this).attr("id").replace("dish-","");;

    $("#" + card_id).toggleClass("open");
  });
};
export { recipeInformationToggle };



