require 'google_drive'

session = GoogleDrive::Session.from_config('config.json')

# Title 指定、Google Documentに変換しない でアップロード
file = session.upload_from_file('hello.txt')
puts "FILE: #{file.human_url}"

# サブフォルダへ配下に移動
sub_folder_id = '1I0mtP5XWDaTCiHsTS71HwQnYFb_5JR-N'
sub_folder = session.collection_by_id(sub_folder_id)
sub_folder.add(file)