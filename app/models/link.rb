class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments


#this method only updates the link's score when the 
#comment is saved. Previously I did another method which 
#incremented the link's score right when the vote_up method 
#is called. I did this method because when
#everone else on google chat seemed to prefer the 
#after save method
# 
def compute_score
	self.score = 0
	self.comments.each do |comment|
		self.score+= comment.score
	end
	self.save
	self.reload
end



end
