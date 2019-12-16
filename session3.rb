require 'google_drive'

session = GoogleDrive::Session.from_config('config.json')

# Google DriveでFolderを選択した時のURLの末尾のハッシュ値
# 例: https://drive.google.com/drive/folders/xxx_xxx_xxx
root_folder_id = '1jx9pRUVQPJrC3wiFr6ifExwXHLkeMZTS'
sub_folder_name = 'hello_sub_folder'

root_folder = session.collection_by_id(root_folder_id)
sub_folder = root_folder.create_subfolder(sub_folder_name)

puts "SUBFOLDER: #{sub_folder.human_url}"