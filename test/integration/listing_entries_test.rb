require 'test_helper'

class ListingEntriesTest < ActionDispatch::IntegrationTest
  ### taken out because API currently is not namespaces seperately
  # setup { host! 'api.example.com' }

  test 'returns list of all entries' do
    get '/entries'
    assert_equal 200, response.status
    refute_empty response.body
  end 

  test 'returns list of all entries in JSON' do
    get '/entries', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    refute_empty response.body
  end 

  test 'returns list of all entries in XML' do
    get '/entries', {}, { 'Accept' => Mime::XML }
    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
    refute_empty response.body
  end 


  test 'returns entries filtered by blog' do

    entry1 = Entry.create!(id: 1000, title: 'Breaking News', url:'http://google.com', author:'John Grisham', content:'Ene Mene Muh und raus bist du!', blog_id: 1)
    entry2 = Entry.create!(id: 1001, title: 'You will not believe it!', url:'http://yahoo.com', author:'Jean Paul Satre', content:'Ene Mene Muh und raus bist du!', blog_id: 2)

    get '/entries?blog_id=1', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status

    entries = json(response.body)
    titles = entries.collect { |t| t[:title] }

    assert_includes titles, 'Breaking News'
    refute_includes titles, 'You will not believe it!'

  end

  test 'returns entry by id' do
    entry = Entry.create!(id: 1000, title: 'Breaking News', url:'http://google.com', author:'John Grisham', content:'Ene Mene Muh und raus bist du!', blog_id: 1)

    get "/entries/#{entry.id}", {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status

    entry_response = json(response.body)
    assert_equal entry.title, entry_response[:title]
  end


end