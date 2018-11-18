  <h1>The Groud Rules:</h1>

<ol>
  <li>
    First and foremost: we are looking to develop a profesisonal quality webapp which will be used for a prefessional portfolio.
  </li>
  <li>
    All suggestions and bug will be documented inside the project <a href="https://github.com/brian-welch/reclaim_dinner/issues" target="new">ISSUES</a>. Even bugs on your own responsibility should be documented there if it is not something you are immediately going to deal with.
  </li>
  <li>
    If there isn't a ticket, then there isn't an issue to fix.
  </li>
  <li>
    The head designer has final say about all suggestions regarding UX, colors forms.</li>
  <li>
    The Project Leader has final say on what is to prioritize and the end goal of the webapp
  </li>
  <li>
    The development schedule and plan should be addressed daily before work commences.
  </li>
  <li>
    Everyone sha respect others' designated role and ability/responsibility to take decisions for their areas - and respect that decision objectively without offence.
  </li>
  <li>
    Once the finished project is decided upon at the onset of the deveopment, no additional functionality, features, etc.; will be added or worked on until the agreed goal is reached. Only after the final app is developed should we add new functionality. 
  </li>
</ol>
<hr>

<body>
  <h1>Project Information:</h1>
  <hr>
  <table style="border-radius: 3px; background-color: #f0f0f0; box-shadow: inset 0 0 2px rgba(0, 0, 0, 0.4);" cellpadding="5" cellspacing="5">
    <tr>
      <th>Role</th><th>Name</th><th>Core Duties</th>
    </tr>
    <tr>
      <td style="padding:5px;padding-right: 15px; text-align: right;">Project Leader:</td>
      <td>? ? ? ? ?</td>
      <td><ul>
        <li>Prioritizes development schedule</li>
        <li>Make sure user journey is mapped, documented & communicated</li>
        <li>Has the best overview of project and active tickets</li>
      </ul></td>
    </tr>
    <tr>
      <td style="padding:5px;padding-right: 15px; text-align: right;">Lead Designer:</td>
      <td>Brian Welch</td>
      <td><ul>
        <li>Owns the 'brand' & design</li>
        <li>Frondend developer</li>
        <li>GUI</li>
      </ul></td>
    </tr>
    <tr>
      <td style="padding:5px;padding-right: 15px; text-align: right;">Lead Developer:</td>
      <td>? ? ? ? ?</td>
      <td><ul>
        <li>Owns the 'logic' of the app</li>
        <li>Backend developer</li>
        <li>Responsible for DB, controllers, routes, seeds & plugins/libraries</li>
      </ul></td>
    </tr>
    <tr>
      <td style="padding:5px;padding-right: 15px; text-align: right;">Backend Support:</td>
      <td>? ? ? ? ?</td>
      <td><ul>
        <li>? ? ? ? ?</li>
        <li>? ? ? ? ?</li>
        <li>? ? ? ? ?</li>
      </ul></td>
    </tr>
  </table>
  <hr>
  <h2>Phase 1</h2>
  <p><strong>Objective:</strong>
    <ul>
      <li>
        Guest can view all recipes(index); Guest can view Details of a recipe(show
      </li>
    </ul>
  </p>
  <p><strong>Frontend:</strong>
    <ul>
      <li>
        Componts to be completed for these views:
        <ul>
          <li>recipe_card</li>
          <li>navbar</li>
          <li>footer</li>
        </ul>
      </li>
      <li>
        Layout to be completed for these views:
        <ul>
          <li>list_page</li>
          <li>detail_page</li>
        </ul>
      </li>
    </ul>
  </p>
  <p><strong>Backend:</strong>
    <ul>
      <li>
        Verify DB configuration with instructors
      </li>
      <li>
        Relevant controllers must be generated/completed:
        <ul>
          <li>index</li>
          <li>show</li>
        </ul>
      </li>
      <li>
        Routes must completed
      </li>
    </ul>
  </p>




  <hr>




  <h2>Phase 1.1</h2>
  <p><strong>Objective:</strong>
    <ul>
      <li>
        Guest can sign up for an account/login
      </li>
    </ul>
  </p>
  <p><strong>Frontend:</strong>
    <ul>
      <li>
        Componants to be completed for this objective:
        <ul>
          <li>avatar</li>
          <li>navbar[navigation]</li>
          <li>login_form</li>
          <li>signup_form</li>
          <li>button</li>
        </ul>
      </li>
      <li>
        Layout to be completed for these views:
        <ul>
          <li>?</li>
        </ul>
      </li>
    </ul>
  </p>
  <p><strong>Backend:</strong>
    <ul>
      <li>
        Simple_form must be coded and tested
      </li>
      <li>
        Validations on models:
        <ul>
          <li>first_name, last_name, email, password</li>
        </ul>
      </li>
    </ul>
  </p>




  <hr>




  <h2>Phase 2</h2>
  <p><strong>Objective:</strong>
    <ul>
      <li>
        User can edit their profile
      </li>
    </ul>
  </p>
  <p><strong>Frontend:</strong>
    <ul>
      <li>
        Componants to be completed for this objective:
        <ul>
          <li>?</li>
        </ul>
      </li>
      <li>
        Layout to be completed for these views:
        <ul>
          <li>Profile Page</li>
        </ul>
      </li>
    </ul>
  </p>
  <p><strong>Backend:</strong>
    <ul>
      <li>
        Form must be coded and tested
      </li>
      <li>
        Cloudinary!
      </li>
      <li>
        Social Media API connection!
      </li>
    </ul>
  </p>




  <hr>




  <h2>Phase 3</h2>
  <p><strong>Objective:</strong>
    <ul>
      <li>
        User can save recipes to the user_recipes table. First functionality should be:
        <ul>
          <li>goes to a page where that week is displayed by default</li>
          <li>each day will be prepopulated with a random recipe</li>
          <li>user and lock a recipe on a day</li>
          <li>user can re-shuffle recipes which are not locked(AJAX)</li>
          <li>user must save the scheduler</li>
          <li>User can do go to next(other) weeks via simple navigation. going to a new week should submit the form to save it before loading the different week</li>
          <li>user should be able to unlock a recipe/remove it from the database</li>
        </ul>
      </li>
    </ul>
  </p>
  <p><strong>Frontend:</strong>
    <ul>
      <li>
        Componants to be completed for this objective:
        <ul>
          <li>?</li>
        </ul>
      </li>
      <li>
        Layout to be completed for these views:
        <ul>
          <li>Scheduler Page</li>
        </ul>
      </li>
    </ul>
  </p>
  <p><strong>Backend:</strong>
    <ul>
      <li>
        AJAX!
      </li>
      <li>
        Schedule form saves to user_recipies table
      </li>
      <li>
        everytime a user visits a schedule page, the app should check the db if the date being displayed have a saved recipe, if not then random
      </li>
    </ul>
  </p>
  <hr>

