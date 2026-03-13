Pod::Spec.new do |s|
  s.name             = 'LSCurl'
  s.version          = '8.17.0'
  s.summary          = 'Pre-compiled libcurl + nghttp2 xcframeworks for iOS/tvOS/macOS/Catalyst'
  s.description      = <<-DESC
    Pre-compiled libcurl and nghttp2 static xcframeworks built from github.com/jasonacox/Build-OpenSSL-cURL.
    Includes libcurl and libnghttp2 for iOS, iOS Simulator, tvOS, tvOS Simulator, macOS, and Mac Catalyst.
    Supports FTP, FTPS, HTTP, HTTPS, HTTP/2, and more protocols.
    Requires LSOpenSSL for TLS support.
    Does NOT include SFTP — SFTP requires libssh2 and is handled separately.
  DESC
  s.homepage         = 'https://github.com/jasonacox/Build-OpenSSL-cURL'
  s.license          = { :type => 'MIT', :text => 'curl is licensed under the MIT/X derivate license' }
  s.author           = { 'Daniel Stenberg' => 'https://curl.se', 'Jason Cox' => 'https://github.com/jasonacox' }

  s.source = {
    :http => 'https://github.com/jasonacox/Build-OpenSSL-cURL/releases/download/1.0.3/libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0.tgz',
    :type => 'tgz',
  }

  s.ios.deployment_target    = '15.0'
  s.osx.deployment_target    = '10.15'
  s.tvos.deployment_target   = '15.0'

  # The archive extracts to: libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/
  # xcframeworks are in: libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/xcframework/
  # headers are in:      libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include/curl/

  s.vendored_frameworks = [
    'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/xcframework/libcurl.xcframework',
    'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/xcframework/libnghttp2.xcframework',
  ]

  s.source_files        = 'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include/curl/**/*.h'
  s.public_header_files = 'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include/curl/**/*.h'
  s.header_mappings_dir = 'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include'

  s.libraries = ['z']

  s.dependency 'LSOpenSSL', '~> 3.0'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
  }

  s.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/LSCurl/libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0/include"',
  }
end
