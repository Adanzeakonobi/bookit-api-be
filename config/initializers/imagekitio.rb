ImageKitIo.configure do |config|
    if Rails.env.development?
      config.public_key = 'public_L9DlQkS0hg6VLiImnISLFnyt8ZY='
      config.private_key = 'private_SRfpY1r+6vFDrUoZFM4y1Ku7tw4='
      config.url_endpoint = 'https://ik.imagekit.io/5dhltcwlp'
    end
    config.service = :active_storage
  end