# == Schema Information
#
# Table name: util_blob
#
#  blob_id            :integer          not null, primary key
#  guid               :uuid             not null
#  date_created       :datetime         not null
#  date_modified      :datetime         not null
#  created_by         :varchar(50)      not null
#  modified_by        :varchar(50)      not null
#  file_ext           :varchar(20)      default(""), not null
#  mime_type          :varchar(100)     default(""), not null
#  blob               :binary(214748364
#  original_file_name :varchar(100)     default(""), not null
#  title              :varchar(100)     default(""), not null
#  description        :varchar(255)     default(""), not null
#  document_type_id   :integer
#

class Arena::Blob < Arena::Base
  self.primary_key= :blob_id
  self.table_name= :util_blob
end
