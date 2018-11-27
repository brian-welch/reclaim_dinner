function recipeInformationToggleAlt() {
  const recipeImg = document.querySelectorAll(".index-single-recipe-image");


  $(".index-single-recipe-image").hover(function () {
    $(".index-single-recipe-image").not(this).toggleClass("index-single-recipe-unfocus");
    $(this).toggleClass("index-single-recipe-focus");
    $("#dynamic-recipe-name").html($(this).attr("data-recipe-name")).fadeIn(1);
  });
  $(".index-single-recipe-image").mouseout(function () {
    $("#dynamic-recipe-name").fadeOut(1);
  });
  $(".index-single-recipe-image").click(function () {
    $(".recipe-summary-block-outer").removeClass("show-summary");
    $("#info_card-" + $(this).attr("data-recipe-id")).toggleClass("show-summary");
  });

  // the function below was taken/modified from: https://stackoverflow.com/questions/1403615/use-jquery-to-hide-a-div-when-the-user-clicks-outside-of-it
  $(document).mouseup(function(e) {
    var container = $(".index-single-recipe-image");
    // if the target of the click isn't the container nor a descendant of the container
    if (!container.is(e.target) && container.has(e.target).length === 0)
    {
        $(".recipe-summary-block-outer").removeClass("show-summary");
    }
  });
}

export { recipeInformationToggleAlt };
