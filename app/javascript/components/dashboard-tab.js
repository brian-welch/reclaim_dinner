function changeTabContent() {
  $(".dashboard-tab-button").click(function(){
    $(".dashboard-tab-button").removeClass("active-tab");
    console.log("after removing active-tab class");
    $(".absoluto").removeClass("top-tab");
    console.log("after removing top-tab class");
    $(this).addClass("active-tab");
    var whichTab = $(this).attr("data-tab-content");
    console.log(whichTab);
    $("#" + whichTab).addClass("top-tab");

  });
};

export { changeTabContent };
