Pod::Spec.new do |s|
  s.name         = 'SwiftGif'
  s.version      = '1.4.1'
  s.summary      = 'A small UIImage extension with gif support'
  s.homepage     = 'https://github.com/bahlo/SwiftGif'
  s.license      = 'MIT'
  s.author       = { 'Arne Bahlo': 'hallo@arne.me' }

  s.ios.deployment_target = '8.0'

  s.source = {
    git: 'https://github.com/bahlo/SwiftGif.git',
    tag: 'v1.4.1'
  }

  s.source_files = 'SwiftGifCommon/*.swift'
end
