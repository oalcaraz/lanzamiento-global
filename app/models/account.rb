require 'digest/md5'

class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :trackable

  belongs_to :plan
  belongs_to :refer, :class_name => 'Account'

  validates :username, presence: true
  validates :username, length: { in: 3..20 }
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, format: { with: /\A[[:alnum:]]+\z/ }
  
  
  def avatar
    'http://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(self.email.downcase) + '?s=35'
  end
end
 