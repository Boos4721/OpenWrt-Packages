local ipc = require "luci.ip"

local m = Map("mqos", translate("Quality of Service by MAC"))

local s = m:section(TypedSection, "global", "")
s.anonymous = true

local e = s:option(Flag, "enabled", translate("启用"))

local ifa = s:option(Value, "接口", translate("Interface"),translate("需要先保存应用"))
ifa.datatype = "string"
ifa.default = "br-lan"

local dl = s:option(Value, "download", translate("下载速度 (Mbit/s)"),
                    translate("接口下载速度"))
dl.datatype = "and(uinteger,min(1))"

local ul = s:option(Value, "upload", translate("上传速度 (Mbit/s)"),
                    translate("接口上传速度"))
ul.datatype = "and(uinteger,min(1))"

s = m:section(TypedSection, "device",
              translate("基于MAC地址限速"))
s.template = "cbi/tblsection"
s.anonymous = true
s.addremove = true
s.sortable = true

local mac = s:option(Value, "mac", translate("地址"))
mac.datatype = "macaddr"

ipc.neighbors({family = 4, dev = luci.sys.exec("uci get mqos.@global[0].interface")},
              function(n)
    if n.mac and n.dest then
        mac:value(n.mac, "%s (%s)" % {n.dest:string(), n.mac})
    end
end)

dl = s:option(Value, "download", translate("下载速度 (Mbit/s)"))
dl.datatype = "and(uinteger,min(1))"

ul = s:option(Value, "upload", translate("上传速度 (Mbit/s)"))
ul.datatype = "and(uinteger,min(1))"

comment = s:option(Value, "comment", translate("备注"))

return m
