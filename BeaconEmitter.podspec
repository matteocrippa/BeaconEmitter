Pod::Spec.new do |s|
  s.name             = 'BeaconEmitter'
  s.version          = '0.2.1'
  s.summary          = 'A simple Beacon emitter writter in Swift.'

  s.description      = <<-DESC
Beacon emitter built in Swift on top of Corebluetooth.
It works with iOS and tvOS based devices
                       DESC

  s.homepage         = 'https://github.com/matteocrippa/BeaconEmitter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matteo Crippa' => '' }
  s.source           = { :git => 'https://github.com/matteocrippa/BeaconEmitter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/ghego20'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'BeaconEmitter/Classes/**/*'
  
  s.frameworks = 'CoreBluetooth'
end
