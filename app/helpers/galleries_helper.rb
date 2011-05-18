module GalleriesHelper
  def s3_upload_info
    @s3_upload ||= build_s3_info
  end
  
  def build_s3_info
    # s3.yml is a file in the config folder, it's formatted for paperclip
    s3config = YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env]
    bucket = s3config['bucket']
    access_key = s3config['access_key_id']
    secret = s3config['secret_access_key']
    key = "images/"
    expiration = 10.hours.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z')
    max_filesize = 5.megabytes
    sas = '201' # Tells amazon to redirect after success instead of returning xml
    policy = Base64.encode64(
      "{'expiration': '#{expiration}',
        'conditions': [
          {'bucket': '#{bucket}'},
          ['starts-with', '$key', '#{key}'],
          {'success_action_status': '#{sas}'},
          ['content-length-range', 1, #{max_filesize}],
          ['starts-with', '$filename', ''],
          ['starts-with', '$folder', ''],
          ['starts-with', '$fileext', '']
        ]}
      ").gsub(/\n|\r/, '')
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), secret, policy)).gsub(/\n| |\r/, '')
    {:access_key => access_key, :key => key, :policy => policy, :signature => signature, :sas => sas, :bucket => bucket}
  end
end
