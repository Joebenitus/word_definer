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

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

get('/words/:id/defs/:def_id') do
  @definition = Definition.find(params[:def_id].to_i())
  erb(:definition)
end

post('/words') do
  word = params[:word]
  word_obj = Word.new({:name => word, :id => nil, :definition => nil})
  word_obj.save()
  @words = Word.all
  erb(:words)
end

post('/words/:id') do
  @word = Word.find(params[:id].to_i())
  word_obj = Word.new({:name => word, :id => nil, :definition => nil})
  word_obj.save()
  @words = Word.all
  erb(:words)
end

post('/words/:id/defs') do
  @word = Word.find(params[:id].to_i())
  body = params[:definition]
  definition = Definition.new({:body => body, :word_id => @word.id, :id => nil})
  definition.save()
  #@defs = Definition.all
  erb(:word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @words = Word.all
  erb(:words)
end

patch('/words/:id/defs/:def_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:def_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

delete('/words/:id/defs/:def_id') do
  @definition = Definition.find(params[:def_id].to_i())
  @definition.delete()
  @word = Word.find(params[:id].to_i)
  erb(:word)
end