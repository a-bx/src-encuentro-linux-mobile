require 'fileutils'
# TODO: remove
require 'nokogiri'

module Config
  # TODO: These need to be removed.
  config  = File.open('tiapp.xml')
  doc     = Nokogiri::XML(config)
  config.close

  # TODO: Project name and root don't have any meaning once building of the devise is within ti core.
  PROJECT_NAME        = "Test_titanium"
  PROJECT_ROOT        = FileUtils.pwd()
  PROJECT_VERSION     = "0.0.1"

  IPHONE_SDK_VERSION  = "4.3"
  ANDROID_SDK_VERSION = ""

  # TODO: In Ti itself, we have the sdk version and the ti directory locations. We should use this configuration instead of
  #       the one within Ti itself. This will allow the user to decide if they're building on a different version or have
  #       Titanium in a different location.
  TI_SDK_VERSION      = "1.6.2"
  TI_DIR              = "/Library/Application\\ Support/Titanium"

  TI_ASSETS_DIR       = "#{TI_DIR}/mobilesdk/osx/#{TI_SDK_VERSION}"
  TI_IPHONE_DIR       = "#{TI_ASSETS_DIR}/iphone"
  TI_ANDROID_DIR      = "#{TI_ASSETS_DIR}/android"
  TI_BUILD            = "#{TI_IPHONE_DIR}/builder.py"

  # Application
  # TODO: No reason for having APP_ID or APP_NAME. Still thinking through APP_DEVISE.
  APP_ID              = doc.xpath('ti:app/id').text
  APP_NAME            = doc.xpath('ti:app/name').text
  APP_DEVICE          = "iphone"
end
