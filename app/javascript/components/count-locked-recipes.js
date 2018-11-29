function bullshit() {

  $("#save-week-button").hide();

  if($(".lock-button-locked").lenght === 2) {
    console.log("inside length loop")
  };

  $(document).ready(function(){
    setInterval(callMe(),1000);
    console.log("hey")
  });
};

function callMe() {
  console.log("fuck me");
}

window.bullshit = bullshit

export { bullshit };

