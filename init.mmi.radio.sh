#!/system/bin/sh
#

# Update the multisim config based on Radio version
radio=`getprop ro.boot.radio`
case $radio in
	"0x3") # Retail US
		setprop persist.radio.multisim.config ""
		setprop ro.mot.build.customerid verizon
		;;
	"0x5") # Dual SIM
		# Temporarily remove setting of this, force users
		# to manually set until device fully supports
		setprop persist.radio.multisim.config dsds
		setprop ro.mot.build.customerid RETBR
		;;
	"0x6") # Retail US
		setprop persist.radio.multisim.config ""
		setprop ro.mot.build.customerid retusa_aws
		;;
	*) # All others
		setprop persist.radio.multisim.config ""
		setprop ro.mot.build.customerid RTGB
		;;
esac
