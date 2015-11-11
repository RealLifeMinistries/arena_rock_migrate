class RockPage < RockBase
  self.primary_key = :Id
  self.table_name = "Page"

  belongs_to :parent, class_name: "RockPage", foreign_key: 'ParentPageId'
  has_many :children, class_name: "RockPage", foreign_key: 'ParentPageId'
end
