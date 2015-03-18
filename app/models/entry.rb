# == Schema Information
#
# Table name: entries
#
#  id        :integer          not null, primary key
#  title     :string(255)
#  url       :string(255)
#  author    :string(255)
#  content   :text
#  published :datetime
#  blog_id   :integer
#
# require 'elasticsearch/model'

class Entry < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :url, uniqueness: true


  belongs_to :blog
  has_and_belongs_to_many :users
  
  paginates_per 10

  def self.create_entry_from_feed(entry)
    

    new_entry = Entry.new(title: entry.title,
                          author: entry.author,
                          content: check_content(entry),
                          published: entry.published,
                          url: entry.url,
                         )
    new_entry
  end

  private

  def self.check_content(entry)
    return entry.content if entry.content
    return entry.summary if entry.summary
  end


end

Entry.import # for auto sync model with elastic search