# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Blog < ActiveRecord::Base
  has_many :entries, dependent: :destroy

  after_create :download_entries_after_blog_create

  def update_feed!
    @newest_entry = entries.order(published: :desc).first
    download_success_date = lambda { |url, feed|
      next unless !@newest_entry || entry.published > @newest_entry.published
      add_new_entry_from_feed(entry)
    }
    Feedjira::Feed.fetch_and_parse(
      url,
      on_success: download_success_date,
      on_failure: download_failure
    )
  end

  def download_all_entries!
    Feedjira::Feed.fetch_and_parse(
      url,
      on_success: download_success,
      on_failure: download_failure
    )
  end

  def download_newest_entries!(number)
    return false if number == 0
    on_success_number = lambda { |url, feed|
      feed.entries[0..number - 1].each do |entry|
        add_new_entry_from_feed(entry)
      end
    }
    feed = Feedjira::Feed.fetch_and_parse(
      url,
      on_success: on_success_number,
      on_failure: download_failure
    )
  end

  def download_newest_entry!
    download_newest_entries!(50)[0]
  end

  def self.update_all_blogs
    Blog.all.each do |blog|
      blog.update_feed!
    end
  end

  def self.fetch_newest_entries_for_all_blogs
    Blog.all.each do |blog|
      blog.download_newest_entries!(50)
    end
  end

  # def push_to_twitter(entry)

  #   @client = Twitter::REST::Client.new do |config|
  #     config.consumer_key        = "OaPIa6c82YEEaFVB8C4WKvWza"
  #     config.consumer_secret     = "txb7PCdjv423WIUpBTnGFzMNAPxnt7O69t2k0fDMOjD6J4nXr0"
  #     config.access_token        = "3094798869-J4XQ1Ml9H4phtk6fQ5v3df6Go0aPvN8IXkYeplK"
  #     config.access_token_secret = "hop2ORt39UtT8JZc94rX5UnGQ0sdwGcjk9Dak3zSmk8tV"
  #   end

  #   @client.update(entry.title)

  # end

  def download_entries_after_blog_create
    download_newest_entries!(500)
  end

  private

  def add_new_entry_from_feed(entry)
    db_entry = Entry.create_entry_from_feed(entry)
    db_entry.blog_id = id
    db_entry.save
    # if db_entry.save?
    #   push_to_twitter(db_entry)
    # end
  end

  def download_success
    lambda { |url, feed|
      feed.entries.each do |entry|
        add_new_entry_from_feed(entry)
      end
    }
  end

  def download_failure
    lambda { |curl, err|
      logger.error "Downloading #{curl} failed due to #{error}"
    }
  end
end
