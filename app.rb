require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:word_new )
end

post('/words') do
  word = params[:word]
  word_obj = Word.new({:name => word, :id => nil})
  word_obj.save()
  @words = Word.all
  erb(:words)
end