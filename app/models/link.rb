class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments


#this method only updates the link's score when the 
#comment is saved. I did this method because 
#everone else on google chat seemed to prefer the 
#after save method, so I went with the crowd 
# 
def compute_score
	self.score = 0
	self.comments.each do |comment|
		self.score+= comment.score
	end
	self.save
	self.reload
end

#this methos is called when a the vote_up method is
#called. I think the the score of the link should be 
#updated right when the score of the comment is increased
def another_method_to_add_scores
	if self.score==0
		self.score=2
	else 
		self.score+=1
	end	
	self.save
end

end
