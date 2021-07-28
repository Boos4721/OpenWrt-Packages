-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Copyright 2008 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.mero", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/mero") then
		return
	end

	local page

	page = entry({"admin", "network", "mero"}, cbi("mero"), _("内网穿透"))
	page.dependent = true
end
