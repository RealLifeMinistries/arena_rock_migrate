class RockPage < RockBase
  self.primary_key = :Id
  self.table_name = "Page"

  belongs_to :parent, class: RockPage, foreign_key: 'ParentPageId'
  has_many :children, class: RockPage, foreign_key: 'ParentPageId'
end
