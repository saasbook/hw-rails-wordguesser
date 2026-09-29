# Self-Check Questions

## Test Yourself!

Complete these questions to earn credit for the assignment.

Select one answer from questions with circle bubbles. Select all that apply from questions with square bubbles.


1. What is the goal of running <code>bundle install</code>? _(Submit via your course's platform to get credit.)_
2. Why is it good practice to specify <code>--without production</code> when running <code>bundle install</code> on your development computer? _(Submit via your course's platform to get credit.)_
3. What file in the Rails <code>app</code> directory structure is the code corresponding to the <code>WordGuesserGame</code> model? _(Submit via your course's platform to get credit.)_
4. In what file is the code that most closely corresponds to the logic in the Sinatra apps’ <code>app.rb</code> file that handles incoming user actions? _(Submit via your course's platform to get credit.)_
5. What class contains that code (the code in <code>Question 4</code>)? _(Submit via your course's platform to get credit.)_
6. From what other class (which is part of the Rails framework) does that class inherit? _(Submit via your course's platform to get credit.)_
7. In what directory is the code corresponding to the Sinatra app’s views (<code>new.erb</code>, <code>show.erb</code>, etc.)? _(Submit via your course's platform to get credit.)_
8. The filename suffixes for these views are different in Rails than they were in the Sinatra app. What information does the rightmost suffix of the filename (e.g.: in <code>foobar.abc.xyz</code>, the suffix <code>.xyz</code>) tell you about the file contents? _(Submit via your course's platform to get credit.)_
9. What information does the other suffix tell you about what Rails is being asked to do with the file? _(Submit via your course's platform to get credit.)_
10. In what file is the information in the Rails app that maps routes (e.g. <code>GET /new</code>) to controller actions? _(Submit via your course's platform to get credit.)_
11. What is the role of the <code>:as => 'name'</code> option in the route declarations of <code>config/routes.rb</code>? (Hint: look at the views.) _(Submit via your course's platform to get credit.)_
12. In the Sinatra version, <code>before do...end</code> and <code>after do...end</code> blocks are used for session management. What is the closest equivalent in this Rails app, and in what file do we find the code that does it? _(Submit via your course's platform to get credit.)_
13. In the Sinatra version, each controller action ends with either <code>redirect</code> (which as you can see becomes <code>redirect_to</code> in Rails) to redirect the player to another action, or <code>erb</code> to render a view. Why are there no explicit calls corresponding to <code>erb</code> in the Rails version? (Hint: Based on the code in the app, can you discern the Convention-over-Configuration rule that is at work here?) _(Submit via your course's platform to get credit.)_
14. In the Sinatra version, we directly coded an HTML form using the <code>&lt;form&gt;</code> tag, whereas in the Rails version we are using a Rails method <code>form_tag</code>, even though it would be perfectly legal to use raw HTML <code>&lt;form&gt;</code> tags in Rails. Can you think of a reason Rails might introduce this "level of indirection"? _(Submit via your course's platform to get credit.)_
15. How are form elements such as text fields and buttons handled in Rails? (Again, raw HTML would be legal, but what’s the motivation behind the way Rails does it?) _(Submit via your course's platform to get credit.)_
16. In the Sinatra version, the <code>show</code>, <code>win</code>, and <code>lose</code> views re-use the code in the new view that offers a button for starting a new game. Which of the following Rails mechanisms allow those views to be re-used in the Rails version? _(Select all that apply.)_ _(Submit via your course's platform to get credit.)_
17. What is a qualitative explanation for why the Cucumber scenarios and step definitions didn’t need to be modified at all to work equally well with the Sinatra or Rails versions of the app? Note that the Sinatra and Rails apps appear the same to a user. _(Submit via your course's platform to get credit.)_

**When you are done with the assignment, please remember to mark as complete.**

---

[← Submission](07-Submission.md) | [Contents](README.md)
