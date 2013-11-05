class Comment < ActiveRecord::Base
  belongs_to :link

after_save :add_score


  def vote_up 
    self.score=self.score+1
    
  end

  def add_score
    if self.link!=nil
      self.link.compute_score
    end
    
   end


end