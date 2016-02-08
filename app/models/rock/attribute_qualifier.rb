# == Schema Information
#
# Table name: AttributeQualifier
#
#  Id          :integer          not null, primary key
#  IsSystem    :boolean          not null
#  AttributeId :integer          not null
#  Key         :string(100)      not null
#  Value       :text(2147483647)
#  Guid        :uuid             not null
#  ForeignKey  :string(100)
#  ForeignGuid :uuid
#  ForeignId   :integer
#

class Rock::AttributeQualifier < Rock::Base
  self.table_name = 'AttributeQualifier'
  self.primary_key = :Id
end
