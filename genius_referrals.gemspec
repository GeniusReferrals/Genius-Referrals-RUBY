Gem::Specification.new do |s|
  s.name = 'genius_referrals'
  s.version = '0.1.0'
  s.summary = 'Official Ruby SDK for the Genius Referrals public API'
  s.description = 'A modern Ruby SDK for the Genius Referrals public API.'
  s.authors = ['Genius Referrals']
  s.email = 'support@geniusreferrals.com'
  s.homepage = 'https://www.geniusreferrals.com'
  s.license = 'MIT'
  s.add_development_dependency('minitest', '~> 5.20')
  s.add_development_dependency('rake', '~> 13.1')
  s.required_ruby_version = '>= 3.0'
  s.files = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end
