require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory     = 'childapp-0907'
    config.fog_credentials = {
      # Amazon S3用の設定
      provider: 'AWS',
      region: ENV['ap-northeast-1'],
      aws_access_key_id: ENV['AKIA2BKHFYCXKNS7DMXP'],
      aws_secret_access_key: ENV['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'],
      path_style: true
    }
    
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end