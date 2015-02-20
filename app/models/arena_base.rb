class ArenaBase < ActiveRecord::Base
  self.abstract_class = true
  protected 
  def nil_if_1900(date)
    if date && date < Date.new(1900,01,02)
      return nil
    else
      return date
    end
  end
end
