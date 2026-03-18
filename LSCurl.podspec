Pod::Spec.new do |s|
  s.name             = 'LSCurl'
  s.version          = '8.17.0'
  s.summary          = 'Pre-compiled libcurl + nghttp2 + libssh2 xcframeworks for iOS/tvOS/macOS/Catalyst'
  s.description      = <<-DESC
    Pre-compiled libcurl, nghttp2 and libssh2 static xcframeworks built from github.com/jasonacox/Build-OpenSSL-cURL.
    Includes libcurl, libnghttp2 and libssh2 for iOS, iOS Simulator, tvOS, tvOS Simulator, macOS, and Mac Catalyst.
    Supports FTP, FTPS, SFTP, SCP, HTTP, HTTPS, HTTP/2, and more protocols.
    Requires LSOpenSSL for TLS support.
  DESC
  s.homepage         = 'https://github.com/jasonacox/Build-OpenSSL-cURL'
  s.license          = { :type => 'MIT', :text => 'curl is licensed under the MIT/X derivate license' }
  s.author           = { 'Daniel Stenberg' => 'https://curl.se', 'Jason Cox' => 'https://github.com/jasonacox' }

  archive_name = 'libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0-libssh2-1.11.1'
  archive_url  = "https://github.com/everappz/Build-OpenSSL-cURL/releases/download/1.0.3.2/#{archive_name}.tgz"

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
    "#{archive_name}/xcframework/libcurl.xcframework",
    "#{archive_name}/xcframework/libnghttp2.xcframework",
    "#{archive_name}/xcframework/libssh2.xcframework",
  ]

  s.source_files        = "#{archive_name}/include/curl/**/*.h"
  s.public_header_files = "#{archive_name}/include/curl/**/*.h"
  s.header_mappings_dir = "#{archive_name}/include"

  s.libraries = ['z']

  s.dependency 'LSOpenSSL', '~> 3.0'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
  }

  s.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/LSCurl/libcurl-8.17.0-openssl-3.0.18-nghttp2-1.68.0-libssh2-1.11.1/include"',
  }
end
