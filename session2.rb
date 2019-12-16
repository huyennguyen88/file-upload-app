require 'google_drive'

session = GoogleDrive::Session.from_config('config.json')
session.files.each { |file| p file.title }