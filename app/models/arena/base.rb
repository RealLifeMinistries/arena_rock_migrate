class Arena::Base < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :development_arena 

  def readonly?
    true
  end

  def destroy
    false
  end

  def delete
    false
  end

end
