require("luci.sys")
--mod by wulishui 20200908

m=Map("autoreboot",translate("Scheduled Reboot"),translate("Scheduled reboot Setting"))

s=m:section(TypedSection,"login","")
s.addremove=false
s.anonymous=true

enable=s:option(Flag,"enable",translate("Enable"))
enable.rmempty = false
enable.default=0

day=s:option(Value,"day",translate("Day"), translate("范围1～31。1-5表示一个月中1至5号；1,5,7表示一个月中1号、5号、7号3天"))
day.rmempty = false
day:value('*',translate("Everyday"))
day.default = '*'

week=s:option(Value,"week",translate("Week Day"), translate("范围0～6。1-5表示一个星期中星期一至五；1,3,5表示表示一个星期中星期一、三、五3天"))
week.rmempty = false
week:depends("day", '*')
week:value('*',translate("Everyday"))
week:value(0,translate("Sunday"))
week:value(1,translate("Monday"))
week:value(2,translate("Tuesday"))
week:value(3,translate("Wednesday"))
week:value(4,translate("Thursday"))
week:value(5,translate("Friday"))
week:value(6,translate("Saturday"))
week.default='*'

--[[
week = s:option(MultiValue, "daysofweek", translate("星期"), translate("可选多天，如留空或全选都表示每天"))
week.optional = false
week.rmempty = false
week.default = '1 2 3 4 5 6 0'
week:value("0", translate("日"))
week:value("1", translate("一"))
week:value("2", translate("二"))
week:value("3", translate("三"))
week:value("4", translate("四"))
week:value("5", translate("五"))
week:value("6", translate("六"))
]]--        

    function validate_time(self, value, section)
        local hh, mm, ss
        hh, mm, ss = string.match (value, "^(%d?%d):(%d%d)$")
        hh = tonumber (hh)
        mm = tonumber (mm)
        if hh and mm and hh <= 23 and mm <= 59 then
            return value
        else
            return nil, "时间格式必须为 HH:MM"
        end
    end

time=s:option(Value,"time",translate("Time"), translate("表示一天中的某个时间点，而不是每间隔此时间一个循环"))
time.rmempty = false
time.default = '07:00'
time.validate = validate_time 

--[[
command=s:option(Value,"command",translate("Command"))
command:value('reboot',translate("Reboot system"))
command:value('poweroff',translate("Power off"))
command:value('wifi down',translate("Wifi down"))
command:value('wifi up',translate("Wifi up"))
command.default='reboot'
]]--

return m

