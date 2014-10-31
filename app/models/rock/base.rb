class Rock::Base < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = 'Id'
  establish_connection :development_rock 

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
