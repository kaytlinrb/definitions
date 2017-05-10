require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/word/new') do
  erb(:word_form)
end

post('/words') do
  input = params.fetch('word_entry')
  @words = Word.new({:word =>input})
  @words.save()
  @words = Word.all
  erb(:index)
end

get('/words/:id') do
  @words = Word.all()
  @word = Word.find(params.fetch('id').to_i())
  @definitions = Definition.all()
  erb(:definition_page)
end

get('/word/:id/definition/') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition_form)
end

post('/word/:id/definitions/') do
definition_input = params.fetch('definition')
@definition = Definition.new({:definition => definition_input})
@definition.save()
@word = Word.find(params.fetch('id').to_i())
@word.add_definition(@definition)
@definitions = Definition.all()
  erb(:definition_page)
end
