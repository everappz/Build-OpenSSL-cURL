Pod::Spec.new do |s|
  s.name             = 'LSOpenSSL'
  s.version          = '3.0.18'
  s.summary          = 'Pre-compiled OpenSSL (libssl + libcrypto) xcframeworks for iOS/tvOS/macOS/Catalyst'
  s.description      = <<-DESC
    Pre-compiled OpenSSL static xcframeworks built from github.com/jasonacox/Build-OpenSSL-cURL.
    Includes libssl and libcrypto for iOS, iOS Simulator, tvOS, tvOS Simulator, macOS, and Mac Catalyst.
    OpenSSL 3.0.x LTS with TLS 1.3 support.
  DESC
  s.homepage         = 'https://github.com/jasonacox/Build-OpenSSL-cURL'
  s.license          = { :type => 'Apache-2.0', :text => 'OpenSSL is licensed under the Apache License 2.0' }
  s.author           = { 'Jason Cox' => 'https://github.com/jasonacox' }

  archive_name = 'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0-libssh2-1.11.1'
  archive_url  = "https://github.com/everappz/Build-OpenSSL-cURL/releases/download/1.0.3.1/#{archive_name}.tgz"

  s.source = {
    :http => archive_url,
    :type => 'tgz',
  }

  s.ios.deployment_target    = '15.0'
  s.osx.deployment_target    = '10.15'
  s.tvos.deployment_target   = '15.0'

  s.prepare_command = <<-SCRIPT
    if [ ! -d "#{archive_name}/xcframework" ]; then
      curl -fsSL "#{archive_url}" -o archive.tgz
      tar xzf archive.tgz
      rm -f archive.tgz
    fi
  SCRIPT

  s.vendored_frameworks = [
    "#{archive_name}/xcframework/libssl.xcframework",
    "#{archive_name}/xcframework/libcrypto.xcframework",
  ]

  s.source_files        = "#{archive_name}/include/openssl/**/*.h"
  s.public_header_files = "#{archive_name}/include/openssl/**/*.h"
  s.header_mappings_dir = "#{archive_name}/include"

  s.frameworks = ['Security']

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
  }

  s.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/LSOpenSSL/libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0-libssh2-1.11.1/include"',
  }
end
