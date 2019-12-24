<h1>#Instructions</h1>

<h3>This repo is to serve for personal use. Any future projects that require Sinatra
will utilize this skeleton repo to save myself time. Any example files will
serve to refresh my memory and save valuable time researching in the event that
I forget the tiny details...</h3>

<h1>#Self notes:</h1>
<h2>-Remember to:</h2>
<strong>-- run "bundle install"
-- run "shotgun"

<p>-If I ever forget how to find and shutdown servers that weren't shutdown properly,</p>
<p>I can run "ps ax | grep shotgun" and then use "kill -9 #{server id}".</p>

<p>-Remember to use "rake -T" to check rake commands. Generally, we are using:</p>

<p>-rake db:create_migration NAME="name_of_database"</p>
<p>---Output being "=># db/migrate/20150914201353_create_dogs.rb"</p>

<p>-Replace your "up" and "down" methods with "change" in your migration file.</p>

<p>---TABLE CREATION EXAMPLE---</p><br>
def change<br>
&nbsp;create_table :dogs do |t|<br>
&nbsp; &nbsp; t.string :name<br>
&nbsp; &nbsp; t.string :breed<br>
&nbsp; end<br>
end<br>

-Use "rake db:migrate SINATRA_ENV=development"
</strong>
