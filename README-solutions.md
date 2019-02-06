>> marks a question that can be entered as an autograded question using
a regexp or other automated feedback.  These should be setup as
"unlimited attemps allowed" but enforcing ~2 minutes between attempts.
They should be 1 point each, since basically there's no way to get it
wrong.

All other questions are peer-graded with a rubric awarding from 0-3 points:
0 = left it blank or gave nonsense answer irrelevant to question
1 = mentioned some of the right keywords, but the answer doesn't
demonstrate that the student understands the concept
2 = close enough to reference answer that the student probably
understands the concept

===========

# Hangperson on Rails 

In this assignment, you'll reuse the *same* game code but "wrap" it in a
simple Rails app instead of Sinatra.

## Learning Goals

Understand the differences between how Rails and Sinatra handle
various aspects of constructing SaaS, including: 

* how routes are defined
and mapped to actions; 
* the directory structure used by each framework;
* how an app is started and stopped; 
* how the app's behavior can be inspected by looking at logs or invoking
a debugger. 

# Run the App

Like substantially all Rails apps, you can get this one running by doing
these steps:

1. Clone or fork the repo

1. Change into the app's root directory `hangperson-rails`

1. Run `bundle install --without production` to install needed Gems

1. Run `rails server` to start the server (on Cloud9, `rails server -p
$PORT -b $IP`)

1. Point a Web browser at the app and visit its homepage.  

**Q1.1.**  What is the goal of running `bundle install`?

A1.1: 
Running this command ensures that correct versions of all the gems
(libraries) needed by the app are properly installed.

**Q1.2.**  Why is it good practice to specify `--without production`
when running it on your development computer?

A1.2: 
Some gems that are required or helpful in production may be
unnecessary or not work at all in development.  For example, the Heroku
production environment uses the Postgres database which requires the
`postgresql` gem, but that gem won't install in development unless you
already have Postgres installed in development (which there's no need
for).



(For most Rails apps you'd also have to create and seed the development
database, but like the Sinatra app, this app doesn't use a database at all.)

Play around with the game to convince yourself it works the same as the
Sinatra version.

# Code Comprehension Questions

## 2. Where Things Are

Both apps have similar structure: the user triggers an action on a game
via an HTTP request; a particular chunk of code is called to "handle"
the request as appropriate; the `HangpersonGame` class logic is called
to handle the action; and usually, a view is rendered to show the
result.  But the locations of the code corresponding to each of these
tasks is slightly different between Sinatra and Rails.

**Q2.1.** Where in the Rails app directory structure is the code corresponding
to the `HangpersonGame` model?  (Give all filenames
relative to the application's home directory; for example,
`app/assets/stylesheets/application.css`)

>> app/models/hangperson_game.rb

**Q2.2.** In what file is the code that most closely corresponds to the 
logic in the Sinatra apps' `app.rb` file that handles incoming user
actions?

>> app/controllers/game_controller.rb

**Q2.3.** What class contains that code?

>> GameController

**Q2.4.** From what other class (which is part of the Rails framework)
does that class inherit? 

>> ApplicationController

**Q2.5.** In what directory is the code corresponding to the Sinatra app's views
(`new.erb`, `show.erb`, etc.)?  

>> app/views/game/

**Q2.6.** The filename suffixes
for these views are different in Rails than they were in the Sinatra
app.  What information does the rightmost suffix of the filename 
(e.g.: in `foobar.abc.xyz`, the suffix `.xyz`) tell
you about the file contents?  

A2.6
The rightmost suffix tells Rails which preprocessor to use (`erb`,
`haml`, etc.) to do any interpolation of Ruby code into the view.

**Q2.7.** What information does the  other suffix tell you about what
Rails is being asked to do with the file?

A2.7
The other suffix tells Rails the type of file that will result from
running that preprocessor; in this case, HTML.

**Q2.8.** In what file is the information in the Rails app that maps
routes (e.g. `GET /new`)  to controller actions?  

>> config/routes.rb

**Q2.9.** What is the role of the `:as => 'name'` option in the route
declarations?  
(Hint:  run the command `rake routes` to see all the defined routes;
then remove the `:as => 'name'` parts of some routes and run the command
again.  Also take a look at the views and how they refer to the routes
used for form submission.)

A2.9: 
It allows a view to reference a route by name, for example
`new_game_path` (which is really a method call: `new_game_path()`),
rather than hardcoding `'/new'`.  This facility decouples the logical
routes from specific URIs, allowing you to change the route mapping
scheme of your app in a single file (an example of DRY--Don't Repeat
Yourself) without having to manually make those changes in all the view
files that reference the routes.


## Session

Both apps ensure that the current game is loaded from the session before
any controller action occurs, and that the (possibly modified) current
game is replaced in the session after each action completes.

**Q3.1.** In the Sinatra version, `before do...end` and `after do...end` blocks
are used for session management.  What is the closest equivalent in this
Rails app, and in what
file do we find the code that does it?

A3.1: 
In `app/controllers/game_controller.rb` we find `before_action`
and `after_action`, which run the named method before or after each
action respectively.


**Q3.2.** A popular serialization format for exchanging data between Web
apps is [JSON](https://en.wikipedia.org/wiki/JSON).  Why wouldn't it
work to use JSON instead of YAML?  (Hint: try replacing `YAML.load()`
with `JSON.parse()` and `.to_yaml` with `.to_json` to do this test.  You
will have to clear out your cookies associated with `localhost:3000`, or
restart your browser with a new Incognito/Private Browsing window, in
order to clear out the `session[]`.  Based on the error messages you get
when trying to use JSON serialization, you should be able to explain why
YAML serialization works in this case but JSON doesn't.)

A3.2:
YAML serialization includes the class of a Ruby object; default
JSON serialization doesn't.  So when the game object comes back and gets
unserialized from JSON, Ruby thinks it is just a hash and not a
`HangpersonGame` object.  Therefore no methods of `HangpersonGame` can
be called on it.

## 4. Views

**Q4.1.** In the Sinatra version, each controller action ends with either
`redirect` (which as you can see becomes `redirect_to` in Rails) to
redirect the player to another action, or `erb` to render a view.  Why
are there no explicit calls corresponding to `erb` in the Rails version?
(Hint: Based on the code in the app, can you discern the
Convention-over-Configuration rule that is at work here?)

A4.1:
By default, a Rails controller action will end by rendering the
view whose directory matches the controller and whose base filename
matches the action.


**Q4.2.** In the Sinatra version, the HTML form that lets the user
submit a new guess was coded using the HTML
`<form>` tag.  What Rails method generates this form tag in the
corresponding Rails view? 

>> form_tag

**Q4.3.** Look at the actual HTML code generated by that Rails method.
What is the route (HTTP verb and URI) to which the form will submit?

>> POST /guess

**Q4.4.** In the Sinatra version, the `show`, `win` and `lose` views re-use the
code in the `new` view that offers a button for starting a new game.
What Rails method allows those views to be re-used in the Rails version?  

>> render

## 5. Cucumber scenarios

The Cucumber scenarios and step definitions (everything under
`features/`, including the support for Webmock in `webmock.rb`) was
copied verbatim from the Sinatra version, with one exception: the
`features/support/env.rb` file is simpler because the `cucumber-rails`
gem automatically does some of the things we had to do explicitly in
that file for the Sinatra version.

Verify the Cucumber scenarios run and pass by running `rake cucumber`.

**Q5.1.** What is a qualitative explanation for why the Cucumber scenarios and
step definitions didn't need to be modified at all to work equally well
with the Sinatra or Rails versions of the app?

A5.1:
Cucumber scenarios are intended to test how the app behaves from
the user's point of view, rather than how that behavior is  implemented.
Since the Rails app has the same behavior as the Sinatra version, and
all the actions are handled by the same routes as in the Sinatra version,
there was no need to change the Cucumber scenarios.

