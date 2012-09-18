class Edition < ActiveRecord::Base
  has_one :featured_article, class_name: Article
end
