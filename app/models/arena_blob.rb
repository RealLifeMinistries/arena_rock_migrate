# == Schema Information
#
# Table name: arena_blobs
#
#  blob_id            :integer          not null, primary key
#  guid               :uuid
#  date_created       :datetime
#  date_modified      :datetime
#  created_by         :string
#  modified_by        :string
#  file_ext           :string
#  mime_type          :string
#  blob               :binary
#  original_file_name :string
#

class ArenaBlob < ArenaBase
  self.primary_key= :blob_id
end
