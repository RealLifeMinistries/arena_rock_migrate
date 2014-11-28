# == Schema Information
#
# Table name: rock_attribute_qualifiers
#
#  Id          :integer          not null, primary key
#  IsSystem    :boolean          not null
#  AttributeId :integer          not null
#  Key         :string           not null
#  Value       :string
#  Guid        :uuid             not null
#  ForeignId   :string
#

class RockAttributeQualifier < ActiveRecord::Base
  self.primary_key = :Id

  belongs_to :rock_attribute, class: RockAttribute, foreign_key: 'AttributeId'
end
