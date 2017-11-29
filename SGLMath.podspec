Pod::Spec.new do |s|
  s.name             = 'SGLMath'
  s.version          = '2.2.0'
  s.summary          = 'SwiftGL Math Library'
  s.description      = <<-DESC
The SwiftGL math library is an implementation of every data type and operator in the GLSL 4.5 specification. It includes every operator in section 5.1 and every function in sections 8.1 to 8.7. You can even swizzle.
                       DESC
  s.homepage         = 'https://github.com/SwiftGL/Math'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AE9RB' => 'dturnbull@gmail.com' }
  s.source           = { :git => 'https://github.com/SwiftGL/Math.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.source_files     = 'Sources/SGLMath/*.swift'
end
