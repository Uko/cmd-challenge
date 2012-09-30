Task Manager
============

General info
------------
For sub/pub notifications a _Private Pub_ gem is used. It uses [Faye](http://faye.jcoglan.com/) to handle all the stuff so separate server should be started with

    rackup private_pub.ru -s thin -E production

for shared task dynamic loading to work.

Goals
-----
User should be able to:
-  `[x]` register in system
-  `[x]` login into system
-  `[x]` add new task
-  `[x]` edit task
-  `[x]` delete task
-  `[x]` share task (share using email of another user in the system who will be also able to manage task afterwards )
-  `[x]` see list of tasks
  -  `[x]` list should auto-update when someone shares tasks with user
  -  `[x]` in the list user should see who has shared task
    
_Use Twitter Bootstrap for UI, please (or something analogical). Cover code by Rspec tests, preferably_