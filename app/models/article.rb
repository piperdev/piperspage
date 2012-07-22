class Article < ActiveRecord::Base
  attr_accessible :title, :body, :featured

  belongs_to :user

  validates :title, :body, :user_id, :presence => true

  class << self
    def left_column
      where(:featured => [false, nil]).all.select.with_index { |_, i| i % 2 == 0 }
    end

    def main_column
      where(:featured => true)
    end

    def right_column
      where(:featured => [false, nil]).all.select.with_index { |_, i| i % 2 == 1 }
    end
  end

  def stub
    target_length = featured ? 300 : 150
    if body.length > target_length + 25
      body.slice(0..target_length) + "..."
    else
      body
    end
  end
end
