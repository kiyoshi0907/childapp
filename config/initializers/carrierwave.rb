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
      aws_access_key_id: ENV['AKIA2BKHFYCXIQRJG6HI'],
      aws_secret_access_key: ENV['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'],
      path_style: true
    }
    
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end