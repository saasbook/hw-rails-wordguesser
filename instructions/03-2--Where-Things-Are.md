# 2. Where Things Are

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

---

[← 1. Run the App](02-1--Run-the-App.md) | [Contents](README.md) | [3. Session →](04-3--Session.md)
