#!/system/bin/sh
#

# Update the multisim config based on Radio version
radio=`getprop ro.boot.radio`
case $radio in
	"0x3") # cdma
		setprop persist.radio.multisim.config ""
		setprop ro.mot.build.customerid verizon
		setprop persist.radio.mode_pref_nv10 1
		setprop ro.telephony.gsm-routes-us-smsc 1
		setprop persist.radio.vrte_logic 2
		setprop persist.radio.0x9e_not_callname 1
		setprop persist.radio.skip_data_check 1
		setprop persist.ril.max.crit.qmi.fails 4
		setprop ro.cdma.home.operator.isnan 1
		;;
	"0x5") # Dual SIM
		# Temporarily remove setting of this, force users
		# to manually set until device fully supports
		setprop ro.mot.build.customerid RETBR
		setprop persist.radio.dont_use_dsd true
		setprop persist.radio.multisim.config dsds
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
