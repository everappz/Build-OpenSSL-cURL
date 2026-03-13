Pod::Spec.new do |s|
  s.name             = 'LSOpenSSL'
  s.version          = '1.0.3'
  s.summary          = 'Pre-compiled OpenSSL (libssl + libcrypto) xcframeworks for iOS/tvOS/macOS/Catalyst'
  s.description      = <<-DESC
    Pre-compiled OpenSSL static xcframeworks built from github.com/jasonacox/Build-OpenSSL-cURL.
    Includes libssl and libcrypto for iOS, iOS Simulator, tvOS, tvOS Simulator, macOS, and Mac Catalyst.
    OpenSSL 3.0.x LTS with TLS 1.3 support.
  DESC
  s.homepage         = 'https://github.com/jasonacox/Build-OpenSSL-cURL'
  s.license          = { :type => 'Apache-2.0', :text => 'OpenSSL is licensed under the Apache License 2.0' }
  s.author           = { 'Jason Cox' => 'https://github.com/jasonacox' }

  s.source = {
    :http => 'https://github.com/jasonacox/Build-OpenSSL-cURL/releases/download/1.0.3/libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0.tgz',
    :type => 'tgz',
  }

  s.ios.deployment_target    = '15.0'
  s.osx.deployment_target    = '10.15'
  s.tvos.deployment_target   = '15.0'

  # The archive extracts to: libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/
  # xcframeworks are in: libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/xcframework/
  # headers are in:      libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include/openssl/

  s.vendored_frameworks = [
    'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/xcframework/libssl.xcframework',
    'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/xcframework/libcrypto.xcframework',
  ]

  s.source_files        = 'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include/openssl/**/*.h'
  s.public_header_files = 'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include/openssl/**/*.h'
  s.header_mappings_dir = 'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include'

  s.frameworks = ['Security']

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
  }

  s.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/LSOpenSSL/libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include"',
  }
end
