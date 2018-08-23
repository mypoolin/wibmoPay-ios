#
# Be sure to run `pod lib lint wibmoPay.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'wibmoPay'
  s.version          = '0.1.7'
  s.summary          = 'WibmoPay iOS SDK is a very simple payment gateway for collecting money from customers.'
  s.description      = <<-DESC
   Note that this is the one that you would need to integrate if you are looking for just a very simple way of collecting money from your customers using a payment gateway (including the options of Credit Card, Debit Card, Net banking, UPI and e-wallets)
                       DESC
  s.homepage         = 'https://github.com/mypoolin/wibmoPay-ios'
  s.license          = { :type => 'Apache', :file => 'License' }
  s.author           = { 'hemavathi' => 'hemavathi.panjaksharam@wibmo.com' }
  s.source           = { :git => 'https://github.com/mypoolin/wibmoPay-ios.git', :tag => s.version.to_s }
  s.swift_version    = '4.1'
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'WibmoPay.framework'
  s.dependency 'CryptoSwift'
 end

