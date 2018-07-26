#
# Be sure to run `pod lib lint WibmoPay.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'wibmoPay'
  s.version          = '0.1.0'
  s.summary          = 'A short description of WibmoPay.'
  s.description      = <<-DESC
   Note that this is the one that you would need to integrate if you are looking for just a very simple way of collecting money from your customers using a payment gateway (including the options of Credit Card, Debit Card, Net banking, UPI and e-wallets)
                       DESC
  s.homepage         = 'https://github.com/anaghvj/WibmoPay'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'hemavathi' => 'hemavathi.panjaksharam@wibmo.com' }
  s.source           = { :http =>'https://github.com/mypoolin/wibmoPay-ios/blob/master/WibmoPay.zip' }
  s.ios.deployment_target = '9.0'
  s.ios.vendored_frameworks = 'WibmoPay.framework'
  s.source_files = 'WibmoPay/Classes/**/*'
  s.resource_bundles = {
    'WibmoPay' => ['WibmoPay/Assets/*.*','WibmoPay/Assets/Images/*.*']
  }
 s.dependency 'CryptoSwift'
 end

