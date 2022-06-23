# WordGuesser on Rails

In a [previous assignment](https://github.com/saasbook/hw-sinatra-saas-wordguesser) you created a simple Web app that plays the Wordguesser game.

More specifically:

1. You wrote the app's code in its own class, `WordGuesserGame`, which knows nothing about being part of a Web app.

2. You used the Sinatra framework to "wrap" the game code by providing a set of RESTful actions that the player can take, with the following routes:

    * `GET  /new`-- default ("home") screen that allows player to start new game
    * `POST /create` -- actually creates the new game
    * `GET  /show` -- show current game status and let player enter a move
    * `POST /guess` -- player submits a letter guess
    * `GET  /win`   -- redirected here when `show` action detects game won
    * `GET  /lose`  -- redirected here when `show` action detects game lost

3. To maintain the state of the game between (stateless) HTTP requests, you stored a copy of the `WordGuesserGame` instance itself in the `session[]` hash provided by Sinatra, which is an abstraction for storing information in cookies passed back and forth between the app and the player's browser.

In this assignment, you'll reuse the *same* game code but "wrap" it in a simple Rails app instead of Sinatra.

## Learning Goals

Understand the differences between how Rails and Sinatra handle various aspects of constructing SaaS, including: 

* how routes are defined and mapped to actions; 
* the directory structure used by each framework;
* how an app is started and stopped; 
* how the app's behavior can be inspected by looking at logs or invoking a debugger. 

## 1. Run the App

**NOTE: You may find these [Rails guides](http://guides.rubyonrails.org/v4.2/) and the [Rails reference documentation](http://api.rubyonrails.org/v4.2.9/) helpful to have on hand.**

Like substantially all Rails apps, you can get this one running by doing these steps:

1. Clone or fork the [repo](https://github.com/saasbook/hw-rails-wordguesser)

2. Change into the app's root directory `hw-rails-wordguesser`

3. Run `bundle install --without production`

4. | Local Development                      	| Codio                                                     	|
    |----------------------------------------	|-----------------------------------------------------------	|
    | Run `rails server` to start the server 	| Run <br>`rails server -b 0.0.0.0`<br> to start the server 	|

### To view your site in Codio
Use the Preview button that says "Project Index" in the top tool bar. Click the drop down and select "Box URL" 

![.guides/img/BoxURLpreview](https://global.codio.com/content/BoxURLpreview.png)

For subsequent previews, you will not need to press the drop down -- your button should now read "Box URL".

**Q1.1.**  What is the goal of running `bundle install`?

**Q1.2.**  Why is it good practice to specify `--without production` when running  it on your development computer?

**Q1.3.** 
(For most Rails apps you'd also have to create and seed the development database, but like the Sinatra app, this app doesn't use a database at all.)

Play around with the game to convince yourself it works the same as the Sinatra version.

## 2. Where Things Are

Both apps have similar structure: the user triggers an action on a game via an HTTP request; a particular chunk of code is called to "handle" the request as appropriate; the `WordGuesserGame` class logic is called to handle the action; and usually, a view is rendered to show the result.  But the locations of the code corresponding to each of these tasks is slightly different between Sinatra and Rails.

**Q2.1.** Where in the Rails app directory structure is the code corresponding to the `WordGuesserGame` model?

**Q2.2.** In what file is the code that most closely corresponds to the  logic in the Sinatra apps' `app.rb` file that handles incoming user actions?

**Q2.3.** What class contains that code?

**Q2.4.** From what other class (which is part of the Rails framework) does that class inherit? 

**Q2.5.** In what directory is the code corresponding to the Sinatra app's views (`new.erb`, `show.erb`, etc.)?  

**Q2.6.** The filename suffixes for these views are different in Rails than they were in the Sinatra app.  What information does the rightmost suffix of the filename  (e.g.: in `foobar.abc.xyz`, the suffix `.xyz`) tell you about the file contents?  

**Q2.7.** What information does the  other suffix tell you about what Rails is being asked to do with the file?

**Q2.8.** In what file is the information in the Rails app that maps routes (e.g. `GET /new`)  to controller actions?  

**Q2.9.** What is the role of the `:as => 'name'` option in the route declarations of `config/routes.rb`?  (Hint: look at the views.)

## 3. Session

Both apps ensure that the current game is loaded from the session before any controller action occurs, and that the (possibly modified) current game is replaced in the session after each action completes.

**Q3.1.** In the Sinatra version, `before do...end` and `after do...end` blocks are used for session management.  What is the closest equivalent in this Rails app, and in what file do we find the code that does it?

**Q3.2.** A popular serialization format for exchanging data between Web apps is [JSON](https://en.wikipedia.org/wiki/JSON).  Why wouldn't it work to use JSON instead of YAML?  (Hint: try replacing `YAML.load()` with `JSON.parse()` and `.to_yaml` with `.to_json` to do this test.  You will have to clear out your cookies associated with `localhost:3000`, or restart your browser with a new Incognito/Private Browsing window, in order to clear out the `session[]`.  Based on the error messages you get when trying to use JSON serialization, you should be able to explain why YAML serialization works in this case but JSON doesn't.)

## 4. Views

**Q4.1.** In the Sinatra version, each controller action ends with either `redirect` (which as you can see becomes `redirect_to` in Rails) to redirect the player to another action, or `erb` to render a view.  Why are there no explicit calls corresponding to `erb` in the Rails version? (Hint: Based on the code in the app, can you discern the Convention-over-Configuration rule that is at work here?)

**Q4.2.** In the Sinatra version, we directly coded an HTML form using the `<form>` tag, whereas in the Rails version we are using a Rails method `form_tag`, even though it would be perfectly legal to use raw HTML `<form>` tags in Rails.  Can you think of a reason Rails might introduce this "level of indirection"?

**Q4.3.** How are form elements such as text fields and buttons handled in Rails?  (Again, raw HTML would be legal, but what's the motivation behind the way Rails does it?)

**Q4.4.** In the Sinatra version, the `show`, `win` and `lose` views re-use the code in the `new` view that offers a button for starting a new game. What Rails mechanism allows those views to be re-used in the Rails version?  

## 5. Cucumber scenarios

The Cucumber scenarios and step definitions (everything under `features/`, including the support for Webmock in `webmock.rb`) was copied verbatim from the Sinatra version, with one exception: the `features/support/env.rb` file is simpler because the `cucumber-rails` gem automatically does some of the things we had to do explicitly in that file for the Sinatra version.

Verify the Cucumber scenarios run and pass by running `rake cucumber`.

**Q5.1.** What is a qualitative explanation for why the Cucumber scenarios and step definitions didn't need to be modified at all to work equally well with the Sinatra or Rails versions of the app?

## Test Yourself!
The following multiple choice questions can have MANY correct answers. Click on an answer's dropdown to check your understanding.

### What is the goal of running <code>bundle install</code>?
<details><summary> To fetch the versions of gems specified in the Gemfile, update the old dependencies in the Gemfile.lock if the versions don't match, and store the Gemfile's new gems as dependencies in the Gemfile.lock</summary><p><blockquote>Correct! <code>bundle install</code> looks at the gems contained in the Gemfile, fetches them, installs the version specified in the Gemfile, and stores the dependencies in the Gemfile.lock. If a Gemfile.lock already exists, the updated gems in the Gemfile will be updated in the Gemfile.lock. Anything that's not specified in the Gemfile will default to the dependencies specified in the Gemfile.lock</blockquote></p></details>
<details><summary> To clear the Gemfile.lock of all dependencies, fetch the versions of gems specified in the Gemfile, and store them as new dependencies in the Gemfile.lock</summary><p><blockquote>Incorrect. <code>bundle install</code> keeps all of it's old dependencies, even if those gems were deleted from the Gemfile. For example, if a gem called "Navbar" is installed as a dependency in the Gemfile.lock, it will stay there after <code>bundle install</code> calls even if "Navbar" was deleted in the Gemfile</blockquote></p></details>

### Why is it good practice to specify <code>--without production</code> when running <code>bundle install</code> on your development computer?
<details><summary> To ensure that we install gems on our local computer rather than setting up a web server for production whose Gemfile.lock contains all dependencies specified in our Gemfile</summary><p><blockquote>Incorrect. <code>bundle install</code> does not set up web servers.</blockquote></p></details>
<details><summary> To omit gems that we only need during production from being downloaded as dependencies in the Gemfile.lock so that our only dependencies are the ones we will use during development</summary><p><blockquote>Correct! It's good practice to specify <code>--without production</code> while running on a development computer because in our Gemfile we can specify a group of gems that should only be downloaded for production versions of our project. Using <code>--without production</code> allows us to skip over downloading the gems we will only use for production, which means we can save time, space, and mental clutter during development</blockquote></p></details>

### What file in the Rails app directory structure is the code corresponding to the WordGuesserGame model? (write full directory path, e.g. app/...)
<details><summary> app/controllers/application_controller.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/controllers/game_controller.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/helpers/application_helper.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/models/word_guesser_game.rb</summary><p><blockquote>Correct!</blockquote></p></details>

### In what file is the code that most closely corresponds to the logic in the Sinatra apps’ app.rb file that handles incoming user actions?
<details><summary> app/controllers/application_controller.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/controllers/game_controller.rb</summary><p><blockquote>Correct!</blockquote></p></details>
<details><summary> app/helpers/application_helper.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/models/word_guesser_game.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### What class contains that code (the code in q4)?
<details><summary> ActionController::Base</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> ApplicationController</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> GameController</summary><p><blockquote>Correct!</blockquote></p></details>

### From what other class (which is part of the Rails framework) does that class inherit?
<details><summary> ActionController::Base</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> ApplicationController</summary><p><blockquote>Correct!</blockquote></p></details>
<details><summary> GameController</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### In what directory is the code corresponding to the Sinatra app’s views (new.erb, show.erb, etc.)?
<details><summary> app/assets</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/views</summary><p><blockquote>Correct! app/views/game contains the Rails equivalents of lose, new, show, and win. The Rails equivalent of layout is in app/views/layout. Overall we could say the directory that contains all files in Sinatra Wordguesser's view directory is app/views (although the Rails case is broken up into subdirectories).</blockquote></p></details>
<details><summary> app/controllers</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/helpers</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/models</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/views</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### The filename suffixes for these views are different in Rails than they were in the Sinatra app. What information does the rightmost suffix of the filename (e.g.: in foobar.abc.xyz, the suffix .xyz) tell you about the file contents?
<details><summary> The file contains Embedded Ruby</summary><p><blockquote>Correct! The differences between the mentioned files in the Rails app in comparison to the Sinatra app are that the files in the Rails app end with ".html.erb" while the files in the Sinatra app only end with ".erb". The ".erb" at the end means the file contains "Embedded Ruby." This is useful in the HTML case because Rails will use the Embedded RuBy to dynamically update the file's data then generate a HTML page</blockquote></p></details>
<details><summary> The file contains HTML</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### What information does the other suffix tell you about what Rails is being asked to do with the file?
<details><summary> Use the code in the file to output a HTML file</summary><p><blockquote>Correct! From a super high level ".html" suffix in the files that contain ".html.erb" means that Rails is being asked to structure a web page and it's content. More specifically, the ".html" tells Ruby to output a page of pure HTML to be rendered.</blockquote></p></details>
<details><summary> Use the code in the file to output a Ruby file</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### In what file is the information in the Rails app that maps routes (e.g. GET /new) to controller actions?
<details><summary> app/controllers/application_controller.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> app/controllers/game_controller.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> config/application.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>
<details><summary> config/routes.rb</summary><p><blockquote>Correct!</blockquote></p></details>
<details><summary> config/secrets.yml</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### What is the role of the :as => 'name' option in the route declarations of config/routes.rb? (Hint: look at the views.)
<details><summary> ____FIXME____</summary><p><blockquote>Correct!</blockquote></p></details>
<details><summary> ____FIXME____</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### In the Sinatra version, <code>before do...end</code> and <code>after do...end</code> blocks are used for session management. What is the closest equivalent in this Rails app, and in what file do we find the code that does it?
<details><summary> <code>before_action</code> and <code>after_action</code> from app/controllers/game_controller.rb</summary><p><blockquote>Correct! The closest equivalent in the rails app is <code>before_action</code> and <code>after_action</code> (or <code>:get_game_from_session</code> and <code>:store_game_in_session</code>). Session management is specifically managed using Rails sessions. We find the code that does it in "app/controllers/game_controller.rb"</blockquote></p></details>
<details><summary> <code>initialize</code> and <code>check_win_or_lose</code> from app/models/word_guesser_game.rb</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### A popular serialization format for exchanging data between Web apps is JSON. Why wouldn’t it work to use JSON instead of YAML? (Hint: try replacing YAML.load() with JSON.parse() and .to_yaml with .to_json to do this test. You will have to clear out your cookies associated with localhost:3000, or restart your browser with a new Incognito/Private Browsing window, in order to clear out the session[]. Based on the error messages you get when trying to use JSON serialization, you should be able to explain why YAML serialization works in this case but JSON doesn’t.)
<details><summary> ____FIXME____</summary><p><blockquote>Correct!</blockquote></p></details>
<details><summary> ____FIXME____</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### In the Sinatra version, each controller action ends with either redirect (which as you can see becomes redirect_to in Rails) to redirect the player to another action, or erb to render a view. Why are there no explicit calls corresponding to erb in the Rails version? (Hint: Based on the code in the app, can you discern the Convention-over-Configuration rule that is at work here?)
<details><summary> Convention-over-Configuration</summary><p><blockquote>Correct! There are no explicit calls corresponding to erb in the Rails version because under Convention-over-Configuration, developer only needs to specify unconventional aspects of the application. Since the erbs in the Sinatra app are named the same as the functions they are called in, this means that in the Rails version we wouldn't have to do explicitly make the erb calls because they are implicitly made by the unless checks for example</blockquote></p></details>
<details><summary> Configuration-over-Convention</summary><p><blockquote>Incorrect :(</blockquote></p></details>

### In the Sinatra version, we directly coded an HTML form using the &lt;form&gt; tag, whereas in the Rails version we are using a Rails method <code>form_tag</code>, even though it would be perfectly legal to use raw HTML &lt;form&gt; tags in Rails. Can you think of a reason Rails might introduce this "level of indirection"?
<details><summary> So we can preform repetitive tasks without having to rewrite the same boilerplate code</summary><p><blockquote>Correct! The Rails method <code>form_tag</code> is useful because it generates a form, renders the HTML, and generates an authenticity token, all of which we would've had to to manually without it. This level of indirection heavily streamlines the process of making apps and follows the concept of using Embedded Ruby to generate HTML that we discussed earlier</blockquote></p></details>
<details><summary> To make rails apps easier to read for those who understand the environment</summary><p><blockquote>Correct!</blockquote></p></details>

### How are form elements such as text fields and buttons handled in Rails? (Again, raw HTML would be legal, but what’s the motivation behind the way Rails does it?)
<details><summary>Using similar built-in helpers such as <code>form_tag</code> for Convention-over-Configuration</summary><p><blockquote>Correct! Form elements also can be generated and implemented into the pipeline using the built in helpers in Rails. The motivation is to comply with the Convention-over-Configuration ideology where developers need to make less decisions while coding.</blockquote></p></details>
<details><summary> Using similar built-in helpers such as <code>form_tag</code> for Configuration-over-Convention</summary><p><blockquote>Incorrect. Rememeber that Ruby on Rails follows the Convention-over-Configuration principle</blockquote></p></details>

### In the Sinatra version, the show, win and lose views re-use the code in the new view that offers a button for starting a new game. What Rails mechanism allows those views to be re-used in the Rails version?
<details><summary> <code>&lt;% render :template =&gt; 'game/new' %&gt;</code></summary><p><blockquote>Incorrect. <code>&lt;% %&gt;</code> executes the Ruby code inside of the brackets!</blockquote></p></details>
<details><summary> <code>&lt;%= render :template =&gt; 'game/new' %&gt;</code></summary><p><blockquote>Correct! <code>&lt;%= %&gt;</code> prints to the erb file</blockquote></p></details>
<details><summary> <code>&lt;%== render :template =&gt; 'game/new' %&gt;</code></summary><p><blockquote>Incorrect. <code>&lt;%== %&gt;</code> prints something verbatim (i.e. w/o escaping) into erb file</blockquote></p></details>

### What is a qualitative explanation for why the Cucumber scenarios and step definitions didn’t need to be modified at all to work equally well with the Sinatra or Rails versions of the app? Note that the Sinatra and Rails apps appear the same to a user.
<details><summary> Cucumber scenarios test only what users can see, so if functionality persists across versions we don't need to update tests</summary><p><blockquote>Correct! The Cucumber scenarios and step definitions didn't need to be modified at all to work equally well with the Sinatra or Rails versions of the app because they can only do what the user can do. Since Sinatra and Rails are back end, if they are set up in a way where the functionality is the same for a human user of the webpage, the scenarios and definitions should not be affected. TLDR Since the Cucumber scenarios and step definitions look at the front end, changes to the back end while preserving front end functionality will not require modifications</blockquote></p></details>
<details><summary> Sinatra and Rails compile down to the same code, so both versions will be interpreted by Cucumber in exactly the same way</summary><p><blockquote>Incorrect. There is no guarentee that Sinatra and Rails compile to the same code. Think about what Cucumber has access to see.</blockquote></p></details>

