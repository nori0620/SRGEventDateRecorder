
Pod::Spec.new do |s|

  s.name         = "SRGEventDateRecorder"
  s.version      = "0.0.2"
  s.summary      = "Persist event date and count easily."
  s.homepage     = "https://github.com/soragoto/SRGEventDateRecorder"
  s.license      = "MIT"
  s.author       = { "Norihiro Sakamoto" => "nori0620@gmail.com" }
  s.source       = { :git => "https://github.com/soragoto/SRGEventDateRecorder.git", :tag => "0.0.2" }
  s.platform     = :ios, '6.0'
  s.source_files = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true

end
