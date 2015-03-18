class User < ActiveRecord::Base
  
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  has_and_belongs_to_many :entries

  def add_entry_to_bookmarks!(user, entry)
    @user.entries << @entry
  end

  def remove_entry_from_bookmarks!(user, entry)
    @user.entries.destroy(@entry.id)
  end

end
