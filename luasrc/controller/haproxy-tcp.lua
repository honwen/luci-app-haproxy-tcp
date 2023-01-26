module("luci.controller.haproxy-tcp", package.seeall)

function index()
    page = entry({"admin", "services", "haproxy-tcp"}, cbi("haproxy-tcp"),
                 _("HAProxy-TCP"), 55)
    page.acl_depends = {"luci-app-haproxy-tcp"}
end
