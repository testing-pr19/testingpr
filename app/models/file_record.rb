class FileRecord < ApplicationRecord
  belongs_to :uploaded_file
  belongs_to :invigilator, required: false
end
