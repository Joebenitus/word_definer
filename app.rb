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

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post('/words') do
  word = params[:word]
  word_obj = Word.new({:name => word, :id => nil, :definition => nil})
  word_obj.save()
  @words = Word.all
  #@definition = []
  erb(:words)
end