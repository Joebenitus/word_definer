require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'Serendipitious')
    click_on('Submit!')
    expect(page).to have_content('Serendipitious')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition') do
    word = Word.new({ :name => 'Serendipitous', :id => nil, :definition => nil })
    word.save
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'Something good happening by accident')
    click_on('Add definition')
    expect(page).to have_content('Something good happening by accident')
  end
end

describe('create an edit word path', {:type => :feature}) do
  it('edits a word') do
    word = Word.new({ :name => 'Serendipitous', :id => nil, :definition => nil })
    word.save
    visit("/words/#{word.id}/edit")
    fill_in('name', :with => 'Monotony')
    click_on('Update')
    expect(page).to have_content('Monotony')
  end
end

describe('create an edit definition path', {:type => :feature}) do
  it('edits a definition') do
    word = Word.new({ :name => 'Monotony', :id => nil, :definition => nil })
    word.save
    definition = Definition.new({ :body => 'Repetitive and bland', :word_id => word.id, :id => nil })
    definition.save
    visit("/words/#{word.id}/defs/#{definition.id}")
    fill_in('name', :with => 'Lack of variety and interest')
    click_on('Update definition')
    expect(page).to have_content('Lack of variety and interest')
  end
end