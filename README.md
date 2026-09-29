# CHIP 4.6: WordGuesser on Rails

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

## Developing Your Assignment

There are four supported ways to work on this assignment; pick one and see
[DEVELOPING.md](DEVELOPING.md) for detailed setup instructions:

1. **Local development.** Install the Ruby version listed in `.ruby-version`
   (via rvm, rbenv, or asdf), then install the gems and start the app:

   ```sh
   $ gem install bundler
   $ bundle install
   $ bin/rails server
   ```

   The app is then at `http://localhost:3000`, and `bundle exec cucumber` runs
   its Cucumber scenarios.

2. **Local development with Docker.** No Ruby install needed — build the
   provided `Dockerfile` and start a shell in a container, mounting your
   working copy so your edits are picked up without a rebuild and publishing
   the port the app serves on:

   ```sh
   $ docker build -t hw-rails-wordguesser .
   $ docker run -it --rm -p 3000:3000 -v "$(pwd)":/app hw-rails-wordguesser
   ```

   Inside the container, start the app with `bin/rails server -b 0.0.0.0` and
   visit `http://localhost:3000` in your own browser.

3. **Codio.** If your course uses Codio, open the assignment from your Codio
   course page — everything is preinstalled. Start the app with
   `bin/rails server -b 0.0.0.0` and open it with the "Box URL" button.

4. **GitHub Codespaces.** From your copy of the repo on GitHub, choose
   **Code → Codespaces → Create codespace** to get a browser-based VS Code
   environment built from the same `Dockerfile`, with all dependencies
   installed for you. Start the app with `bin/rails server -b 0.0.0.0`; the
   forwarded port 3000 opens it in your browser.

## Instructions

The assignment itself is in the [instructions](instructions/README.md) folder
of this repo (the same pages your course may also show you on Codio or on the
CHIPS instructions website):

* [1. Run the App](instructions/02-1--Run-the-App.md)
* [2. Where Things Are](instructions/03-2--Where-Things-Are.md)
* [3. Session](instructions/04-3--Session.md)
* [4. Views](instructions/05-4--Views.md)
* [5. Cucumber scenarios](instructions/06-5--Cucumber-scenarios.md)
* [Submission](instructions/07-Submission.md)

Answer the questions on those pages as your course directs, and submit the app
on Gradescope as described on the Submission page.
