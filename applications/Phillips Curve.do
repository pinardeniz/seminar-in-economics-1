tsset date
twoway (tsline ur)
twoway (tsline inf)
scatter inf ur
scatter inf ur || lfit inf ur
regress inf ur
regress inf c.time
predict inf_detrended, residuals
twoway (tsline inf_detrended)
regress ur c.time
predict ur_detrended, residuals
twoway (tsline ur_detrended)
scatter inf_detrended ur_detrended || lfit inf_detrended ur_detrended
