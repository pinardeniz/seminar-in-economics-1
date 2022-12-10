generate loggdppc=log(gdppc)
generate logco2=log(co2)
histogram loggdppc
histogram loggdppc
generate loggdppc2=loggdppc^2
regress logco2 loggdppc loggdppc2
scatter logco2 loggdppc
scatter logco2 loggdppc || lfit logco2 loggdppc
scatter logco2 loggdppc || qfit logco2 loggdppc
