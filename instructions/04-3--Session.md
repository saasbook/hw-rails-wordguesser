# 3. Session

Both apps ensure that the current game is loaded from the session before any controller action occurs, and that the (possibly modified) current game is replaced in the session after each action completes.

**Q3.1.** In the Sinatra version, `before do...end` and `after do...end` blocks are used for session management.  What is the closest equivalent in this Rails app, and in what file do we find the code that does it?

Notice that when the game is loaded back out of the session, the YAML loader is told exactly which classes it is allowed to rebuild (`permitted_classes: [WordGuesserGame]`).  Modern Ruby's YAML refuses to instantiate arbitrary objects from data it doesn't trust, and a cookie that comes back from the browser is exactly that: the player could have edited it.

**Q3.2.** A popular serialization format for exchanging data between Web apps is [JSON](https://en.wikipedia.org/wiki/JSON).  Why wouldn't it work to use JSON instead of YAML?  (Hint: try replacing the `YAML.safe_load(...)` call with `JSON.parse(session[:game])` and `.to_yaml` with `.to_json` to do this test.  You will have to clear out your cookies associated with `localhost:3000`, or restart your browser with a new Incognito/Private Browsing window, in order to clear out the `session[]`.  Based on the error messages you get when trying to use JSON serialization, you should be able to explain why YAML serialization works in this case but JSON doesn't.)

---

[← 2. Where Things Are](03-2--Where-Things-Are.md) | [Contents](README.md) | [4. Views →](05-4--Views.md)
