class Post < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "600x600>", thumb: "200x200" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	belongs_to :user
	acts_as_votable

	def score
  		self.get_upvotes.size - self.get_downvotes.size
  	end
end
