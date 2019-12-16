require 'google_drive'
class Item < ApplicationRecord
    has_attached_file :picture,  
    path: ":rails_root/public/files/:id/:filename",
    url: "/files/:id/:filename"
    validates_attachment_content_type :picture, content_type: ["application/pdf"]
    def upload_drive
        session = GoogleDrive::Session.from_config('config.json')
        path = "#{Rails.root}/public/files/#{id}/#{picture_file_name}"
        file = session.upload_from_file(path, "#{picture_file_name}", convert: false)
        puts "FILE: #{file.human_url}"
        sub_folder_id = '1I0mtP5XWDaTCiHsTS71HwQnYFb_5JR-N'                                                                 
        sub_folder = session.collection_by_id(sub_folder_id)
        sub_folder.add(file)
    end
end


