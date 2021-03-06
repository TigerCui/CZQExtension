#
#  Be sure to run `pod spec lint CZQExtension.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "CZQExtension"   #项目名称
  s.version      = "0.0.2"          #版本号 与 你仓库的 标签号 对应
  s.summary      = "Some Utilities" #项目简介
  s.homepage     = "https://github.com/TigerCui/CZQExtension" #主页
  s.license      = "MIT" #开源证书

  s.platform     = :ios, "8.0" #平台及支持的最低版本
  s.source       = { :git => "https://github.com/TigerCui/CZQExtension.git", :tag => "#{s.version}" }
  s.frameworks = "UIKit", "Foundation" #支持的框架
  s.requires_arc = true #是否使用arc
 
  s.author             = { "TIGERCUI" => "270310922@qq.com" }
  s.social_media_url   = "https://github.com/TigerCui"

  s.source_files  = "CZQExtension_Demo/CZQExtension/CZQExtension/*.{h,m}" #你代码的位置， CZQExtension/ *.{h,m} 表示 CZQExtension 文件夹下所有的.h和.m文件
#  s.public_header_files = 'CZQExtension_Demo/CZQExtension/CZQExtension/CZQExtensionHeader.h' #头文件接口
  s.dependency 'YYCategories' , '1.0.4'
  #文件层级#
  s.subspec 'models' do |ss|
    ss.source_files = 'CZQExtension_Demo/CZQExtension/CZQExtension/models/*.{h,m}'
  end
  

end
