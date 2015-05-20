class Arena::Base < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "#{Rails.env}_arena".to_sym

  def self.inheritance_column
    nil
  end

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
