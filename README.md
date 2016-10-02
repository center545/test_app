### Info README

This is a test app to display the dynamic form for given field types. The different field types are text, dropdown and checkboxed

Setup

* git clone
* bundle install
* rails db:create
* rails db:migrate
* rails db:seed
* rails s
 

Now the application is configured with test data, and running rails s should get the app ready for testing

#### TODO
* Allow dropdown fields in Edit Page to be editable. i.e. allow user to define custom value not already listed in the dropdown values
* Add the necessary logic in unobtrusive JS (or preferably in Coffeescript)
* The Form needs necessary changes to allow the custom value for any dropdown in the page to be sent, along with the existing form_field_id attribute.
* NOTE: the backend has necessary logic to add the new custom values to the original list of dropdown value suggestions.

