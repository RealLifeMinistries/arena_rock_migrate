# == Schema Information
#
# Table name: AttributeQualifier
#
#  Id          :integer          not null, primary key
#  IsSystem    :boolean          not null
#  AttributeId :integer          not null
#  Key         :string(100)      not null
#  Value       :text
#  Guid        :uuid             not null
#  ForeignId   :string(50)
#

class Rock::AttributeQualifier < Rock::Base
  self.table_name = 'AttributeQualifier'
  self.primary_key = :Id
end
