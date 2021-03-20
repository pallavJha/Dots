#!/bin/bash

i3status | while :
do
	read line
	temperatures=`sensors -j | jq '."coretemp-isa-0000"."Core 0"."temp2_input",."coretemp-isa-0000"."Core 2"."temp4_input",."acpitz-acpi-0"."temp1"."temp1_input",."acpitz-acpi-0"."temp2"."temp2_input",."radeon-pci-0100"."temp1"."temp1_input"' | tr "\n" " "`
	echo "°C $temperatures | $line" || exit 1
done
