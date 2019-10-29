if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.aws_access_key_id = 'AKIAQWA2M3HQTYGJ5CMY'
    config.aws_secret_access_key = '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'
    config.fog_directory = "learning-chain-app"
    config.fog_region = "ap-northeast-1"
    config.gzip_compression = true
  end
end