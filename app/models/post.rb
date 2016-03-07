class Post < ActiveRecord::Base
	validates :title, presence: true, length: {maximum: 30}
	validates :description, presence: true, length: {minimum: 3}

	before_save {self.title = title.slice(0,1).capitalize + title.slice(1..-1)}
end
