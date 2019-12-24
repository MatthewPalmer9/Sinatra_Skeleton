<u><h1>#Instructions</h1></u>

<h3>This repo is to serve for personal use. Any future projects that require Sinatra
will utilize this skeleton repo to save myself time. Any example files will
serve to refresh my memory and save valuable time researching in the event that
I forget the tiny details...</h3>

<u><h1>#Self notes:</h1><u>
<h2>-Remember to:</h2>
<strong>-- run "bundle install"
-- run "shotgun"

<p>-If I ever forget how to find and shutdown servers that weren't shutdown properly,</p>
<p>I can run "ps ax | grep shotgun" and then use "kill -9 #{server id}".</p>

<p>-Remember to use "rake -T" to check rake commands. Generally, we are using:</p>

<p>-rake db:create_migration NAME="name_of_database"</p><br>
---Output being "=># db/migrate/20150914201353_create_dogs.rb"<br>

<p>-Replace your "up" and "down" methods with "change" in your migration file.</p>

<u><h2><p>---TABLE CREATION EXAMPLE---</p></h2></u>
<h3>def change<br>
&emsp;create_table :dogs do |t|<br>
&emsp; &emsp; t.string :name<br>
&emsp; &emsp; t.string :breed<br>
&emsp; end<br>
end<br></h3>

</strong>
