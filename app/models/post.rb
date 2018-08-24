# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  published  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 250 }

end
