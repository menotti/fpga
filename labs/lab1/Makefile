all:
	quartus_map --read_settings_files=on --write_settings_files=off lab1 -c top
	quartus_fit --read_settings_files=off --write_settings_files=off lab1 -c top
	quartus_pgm -c usb-blaster output_files/top.cdf