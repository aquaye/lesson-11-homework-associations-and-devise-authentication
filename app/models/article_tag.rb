class ArticleTag < ActiveRecord::Base
  belongs_to :tags
  belongs_to :articles
end
