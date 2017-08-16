# Hangperson on Rails

In a [previous
assignment](https://github.com/saasbook/hw-sinatra-saas-hangperson) you
created a simple Web app that plays the Hangperson game.

More specifically:

1. You wrote the app's code in its own class, `HangpersonGame`, which
knows nothing about being part of a Web app.

2. You used the Sinatra framework to "wrap" the game code by providing a
set of RESTful actions that the player can take, with the following routes:

* `GET  /new`-- default ("home") screen that allows player to start new game
* `POST /create` -- actually creates the new game
* `GET  /show` -- show current game status and let player enter a move
* `POST /guess` -- player submits a letter guess
* `GET  /win`   -- redirected here when `show` action detects game won
* `GET  /lose`  -- redirected here when `show` action detects game lost

3. To maintain the state of the game between (stateless) HTTP requests,
you stored a copy of the `HangpersonGame` instance itself in the
`session[]` hash provided by Sinatra, which is an abstraction for
storing information in cookies passed back and forth between the app and
the player's browser.

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

# Code Comprehension Questions

## Where Things Are

Both apps have similar structure: the user triggers an action on a game
via an HTTP request; a particular chunk of code is called to "handle"
the request as appropriate; the `HangpersonGame` class logic is called
to handle the action; and usually, a view is rendered to show the
result.  But the locations of the code corresponding to each of these
tasks is slightly different between Sinatra and Rails.


0. Where in the Rails app directory structure is the code corresponding
to the `HangpersonGame` model?

0. Where is the code that most closely corresponds to the controller
logic in the Sinatra apps' `app.rb` file?

0. Where is the code corresponding to the Sinatra app's views
(`new.erb`, `show.erb`, etc.)?  Why do you think the filename suffixes
for these views are different in Rails than they are in Sinatra?

0. How do routes (e.g. `GET /new`) get mapped to route handlers
(controller actions) in Sinatra vs. in Rails?  (Hint: look at
`config/routes.rb`.)  Why do you think Rails adds this extra level of
indirection on routes?

0. What is the role of the `:as => 'name'` option in the route
declarations of `config/routes.rb`?  (Hint: look at the views.)


## Session

Both apps ensure that the current game is loaded from the session before
any controller action occurs, and that the (possibly modified) current
game is replaced in the session after each action completes.

0. Syntactically, what are the differences between how this session
management is done in Rails vs. Sinatra?

0. In the Sinatra version, we stored the `@game` object directly into
`session[]`.  In the Rails version, we
[serialize](https://en.wikipedia.org/wiki/Serialization) the object
into [YAML](https://en.wikipedia.org/wiki/YAML) before storing it in the
`session[]`.  Why do we do this?  (Hint: use the keywords in this
question to do a Web search.)

0. A popular serialization format for exchanging data between Web apps
is [JSON](https://en.wikipedia.org/wiki/JSON).  Why wouldn't it work to
use JSON instead of YAML?  (Hint: try replacing `YAML.load()` with
`JSON.parse()` and `.to_yaml` with `.to_json` to do this test.  You will
have to clear out your cookies associated with `localhost:3000` in order
to nuke the `session[]`.  Based on the error messages you get when
trying to use JSON serialization, you should be able to explain why YAML
serialization works in this case but JSON doesn't.)

## Views

0. In the Sinatra version, each controller action ends with either
`redirect` (which as you can see becomes `redirect_to` in Rails) to
redirect the player to another action, or `erb` to render a view.  Why
are there no explicit calls corresponding to `erb` in the Rails version?

0. How are forms handled differently between Sinatra and Rails views?
(Hint: it would be perfectly legal to use raw HTML `<form>` tags in
Rails; why do you think that's not the preferred way to do it?)

0. How are form elements such as text fields and buttons handled in
Rails?  (Again, raw HTML would be legal, but what's the motivation
behind the way Rails does it?)

