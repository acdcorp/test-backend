# ACD - Backend Test

Using the provided application add the following features:

- Authentication.  Using [shield](https://github.com/cyx/shield).  Make sure to
  add a `current_user` method to [roda](https://github.com/jeremyevans/roda).
  Hook it into the auth component.  Make sure you can't access the root url
  without being logged in.

- Registration.  Hook this into the auth component and make sure it saves to the
  `sqlite3` database using [sequel](https://github.com/jeremyevans/sequel).

- Tasks. Ability to add/remove and mark tasks as read for each user, saving to
  the database.  Make sure to add a datepicker to the due date field.

- Lists.  (Each user should be able to view other users todo lists but NOT have
  permission to edit/delete tasks.

- Bonus.  Make an API.  Display all users and the task count.  Display a single
  user and all their tasks.

**Please use RSPEC to create tests**

To install please run `make install` and then `make` to start the server.

Other Useful Documentation:

- [opal](http://opalrb.org)
- [opal-jquery](https://github.com/opal/opal-jquery)
- [nokogiri](https://github.com/sparklemotion/nokogiri)
- [bower](http://bower.io)

###### Please fork this repository and commit each step of your process.
