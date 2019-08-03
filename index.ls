require! <[
  axios
]>
config = require("config-6du/6du.js")

var web

do !~>
  option = {
      timeout: 6000,
  }
  proxy = await config.line \proxy
  if proxy
    const httpsProxyAgent = require('https-proxy-agent')
    const httpProxyAgent = require('http-proxy-agent')
    option <<<
      httpsAgent: new httpsProxyAgent(proxy),
      httpAgent: new httpProxyAgent(proxy)

  web := axios.create(option)
  web.defaults.headers.common["User-Agent"]="6du"

module.exports = web

