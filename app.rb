require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/word_form') do
  erb(:word_form)
end

post('/filled_form') do
  input = params.fetch('word_entry')
  @words = Word.new({:word =>input})
  @words.save()
  @words = Word.all
  erb(:index)
end

get('/words/:id') do
  erb(:definition_page)
end

get('/definition_form') do
  erb(:definition_form)
end

post('/filled_form/definition') do
  @word = Word.find(params.fetch('id').to_i())
  input = params.fetch('definition_entry')
  @definitions = Definition.new({:definition =>input})
  @definitions.save()
  @definitions = Definition.all
  erb(:definition_page)
end
