# == Schema Information
#
# Table name: Page
#
#  Id                      :integer          not null, primary key
#  InternalName            :string(100)      not null
#  ParentPageId            :integer
#  PageTitle               :string(100)
#  IsSystem                :boolean          not null
#  LayoutId                :integer          not null
#  RequiresEncryption      :boolean          not null
#  EnableViewState         :boolean          not null
#  PageDisplayTitle        :boolean          not null
#  PageDisplayBreadCrumb   :boolean          not null
#  PageDisplayIcon         :boolean          not null
#  PageDisplayDescription  :boolean          not null
#  DisplayInNavWhen        :integer          not null
#  MenuDisplayDescription  :boolean          not null
#  MenuDisplayIcon         :boolean          not null
#  MenuDisplayChildPages   :boolean          not null
#  BreadCrumbDisplayName   :boolean          not null
#  BreadCrumbDisplayIcon   :boolean          not null
#  Order                   :integer          not null
#  OutputCacheDuration     :integer          not null
#  Description             :text(2147483647)
#  IconCssClass            :string(100)
#  IncludeAdminFooter      :boolean          not null
#  Guid                    :uuid             not null
#  BrowserTitle            :string(100)
#  KeyWords                :text(2147483647)
#  HeaderContent           :text(2147483647)
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  ForeignGuid             :uuid
#  ForeignId               :integer
#

class RockPage < RockBase
  self.primary_key = :Id
  self.table_name = "Page"

  belongs_to :parent, class_name: "RockPage", foreign_key: 'ParentPageId'
  has_many :children, class_name: "RockPage", foreign_key: 'ParentPageId'
end
