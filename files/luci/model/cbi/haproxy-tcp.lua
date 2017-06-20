local m, s, o

if luci.sys.call("pgrep -f haproxy-tcp >/dev/null") == 0 then
	m = Map("haproxy-tcp", translate("HAProxy-TCP"), "%s - %s" %{translate("HAProxy-TCP"), translate("RUNNING")})
else
	m = Map("haproxy-tcp", translate("HAProxy-TCP"), "%s - %s" %{translate("HAProxy-TCP"), translate("NOT RUNNING")})
end

s = m:section(TypedSection, "general", translate("General Setting"))
s.anonymous   = true

o = s:option(Flag, "enable", translate("Enable"))
o.rmempty     = false

o = s:option(Value, "listen", translate("Listen Address:Port"))
o.placeholder = "0.0.0.0:6666"
o.default     = "0.0.0.0:6666"
o.rmempty     = false

o = s:option(Value, "timeout", translate("Timeout Connect (ms)"))
o.placeholder = "666"
o.default     = "666"
o.datatype    = "range(33, 10000)"
o.rmempty     = false

o = s:option(Value, "retries", translate("Retries"))
o.placeholder = "1"
o.default     = "1"
o.datatype    = "range(1, 10)"
o.rmempty     = false


o = s:option(DynamicList, "upstreams", translate("UpStream Server"))
o.placeholder = "8.8.8.8:53"
o.rmempty     = false

return m
