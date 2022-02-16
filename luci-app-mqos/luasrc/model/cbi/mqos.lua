local ipc = require "luci.ip"

local m = Map("mqos", translate("Quality of Service by MAC"))

local s = m:section(TypedSection, "global", "")
s.anonymous = true

local e = s:option(Flag, "enabled", translate("Enable"))

local ifa = s:option(Value, "interface", translate("Interface"),translate("Need to save the app first"))
ifa.datatype = "string"
ifa.default = "br-lan"

local dl = s:option(Value, "download", translate("download speed (Mbit/s)"),
                    translate("Interface download speed"))
dl.datatype = "and(uinteger,min(1))"

local ul = s:option(Value, "upload", translate("Upload speed (Mbit/s)"),
                    translate("Interface upload speed"))
ul.datatype = "and(uinteger,min(1))"

s = m:section(TypedSection, "device",
              translate("Speed limit based on MAC address"))
s.template = "cbi/tblsection"
s.anonymous = true
s.addremove = true
s.sortable = true

local mac = s:option(Value, "mac", translate("address"))
mac.datatype = "macaddr"

ipc.neighbors({family = 4, dev = luci.sys.exec("uci get mqos.@global[0].interface")},
              function(n)
    if n.mac and n.dest then
        mac:value(n.mac, "%s (%s)" % {n.dest:string(), n.mac})
    end
end)

dl = s:option(Value, "download", translate("download speed (Mbit/s)"))
dl.datatype = "and(uinteger,min(1))"

ul = s:option(Value, "upload", translate("Upload speed (Mbit/s)"))
ul.datatype = "and(uinteger,min(1))"

comment = s:option(Value, "comment", translate("Remark"))

return m
