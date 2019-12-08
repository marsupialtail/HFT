# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PRICE_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "QUANT_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "STOCK_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.ID_WIDTH { PARAM_VALUE.ID_WIDTH } {
	# Procedure called to update ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID_WIDTH { PARAM_VALUE.ID_WIDTH } {
	# Procedure called to validate ID_WIDTH
	return true
}

proc update_PARAM_VALUE.PRICE_WIDTH { PARAM_VALUE.PRICE_WIDTH } {
	# Procedure called to update PRICE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PRICE_WIDTH { PARAM_VALUE.PRICE_WIDTH } {
	# Procedure called to validate PRICE_WIDTH
	return true
}

proc update_PARAM_VALUE.QUANT_WIDTH { PARAM_VALUE.QUANT_WIDTH } {
	# Procedure called to update QUANT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.QUANT_WIDTH { PARAM_VALUE.QUANT_WIDTH } {
	# Procedure called to validate QUANT_WIDTH
	return true
}

proc update_PARAM_VALUE.STOCK_WIDTH { PARAM_VALUE.STOCK_WIDTH } {
	# Procedure called to update STOCK_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STOCK_WIDTH { PARAM_VALUE.STOCK_WIDTH } {
	# Procedure called to validate STOCK_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.PRICE_WIDTH { MODELPARAM_VALUE.PRICE_WIDTH PARAM_VALUE.PRICE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PRICE_WIDTH}] ${MODELPARAM_VALUE.PRICE_WIDTH}
}

proc update_MODELPARAM_VALUE.ID_WIDTH { MODELPARAM_VALUE.ID_WIDTH PARAM_VALUE.ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID_WIDTH}] ${MODELPARAM_VALUE.ID_WIDTH}
}

proc update_MODELPARAM_VALUE.QUANT_WIDTH { MODELPARAM_VALUE.QUANT_WIDTH PARAM_VALUE.QUANT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.QUANT_WIDTH}] ${MODELPARAM_VALUE.QUANT_WIDTH}
}

proc update_MODELPARAM_VALUE.STOCK_WIDTH { MODELPARAM_VALUE.STOCK_WIDTH PARAM_VALUE.STOCK_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STOCK_WIDTH}] ${MODELPARAM_VALUE.STOCK_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

