Pod::Spec.new do |s|
  s.name         = "SandboxManager"

  s.version      = "1.0.0"

  s.summary      = "file handle utils."

  s.homepage     = "https://github.com/ZYXiao/SandboxManager"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "ZYXiao" => "304983615@qq.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ZYXiao/SandboxManager.git", :tag => "1.0.0" }

  s.source_files  = "SandboxManager/*.{h,m}"

  s.frameworks    = 'Foundation'

  s.requires_arc = true
end
