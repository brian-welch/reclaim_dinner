
const recipe_shuffle = document.querySelectorAll(".index-recipe-shuffle-button");
recipe_shuffle.addEventListener("click", (event) => {
  console.log(event);
  console.log(event.currentTarget);
  recipe_shuffle.classList.add("thisislocked");
});

<% @five_recipes.each_with_index do |recipe, i| %>
  <% day = days[i] %>
  <%= render "recipes/recipe_display_card", recipe: recipe, day: day %>
<% end %>
