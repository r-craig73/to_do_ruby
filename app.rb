require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/task')
require('./lib/list')
require('pry')
require('pg')

DB = PG.connect({:dbname => "to_do"})

get('/') do
  erb(:home)
end

post('/') do
  name = params.fetch("list")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:success)
end
