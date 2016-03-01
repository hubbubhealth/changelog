require './web'

use Rack::Deflater
use Rack::Session::Cookie,
  key: 'rack.session',
  expire_after: 259200,
  secret: '7b9e9ba1dd1fea4c95b6985b30ac0d69665e63bd2332b8f26944dd16fe840fb946785f20e8590034b66cfc0c0a56dc273bc9f03044d664eb3c1c2a073a8cae5a'

map '/assets' do
  run Web.assets
end
run Rack::Cascade.new [Web]
