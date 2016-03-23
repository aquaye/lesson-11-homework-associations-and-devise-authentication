class Article < ActiveRecord::Base
  belongs_to :author
  has_many :article_tags
  has_many :articles, through: :article_tags

  validates :title, presence: true
  validates :body, presence: true
end
