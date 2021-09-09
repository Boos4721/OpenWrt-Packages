-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Licensed to the public under the Apache License 2.0.

local ipc = require "luci.ip"
local o
require "luci.util"

m = Map("mero", translate("小水滴内网穿透"),translate("小水滴是一个简单易用的内网穿透工具，高性能的反向代理应用."))



s = m:section(NamedSection, "KEY", translate(""))
s.anonymous = true
s.addremove = false

o=s:option(Flag,"enabled",translate("Enabled"))
o.rmempty=false

hn = s:option(Value, "key", translate("Client Key"))
hn.rmempty  = true

local apply = luci.http.formvalue("cbi.apply")
if apply then
       luci.sys.exec("/etc/init.d/mero restart") 
end   

return m