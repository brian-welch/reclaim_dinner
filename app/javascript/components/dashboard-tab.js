function changeTabContent() {
  $(".dashboard-tab-button").click(function(){
    $(".dashboard-tab-button").removeClass("active-tab");
    $(this).addClass("active-tab");
  });
};

export { changeTabContent };
