safety(horn).
safety(wiper).
safety(door).
safety(signal).
safety(switch).
safety(speedometer).

mission(overhead_line).
mission(railway).
mission(traction).
mission(signal).
mission(switch).

immediate(overhead_line).
immediate(switch).
immediate(signal).
immediate(pantograph).

parent(fallen_tree, pantograph).
parent(fallen_tree, overhead_line).
parent(fire, overhead_line).
parent(service_table, switch).
parent(overhead_line, pantograph).
parent(overhead_line, static_inverter).
parent(switch, signal).
parent(static_inverter, ac).
parent(compressor, door).
parent(compressor, horn).
parent(compressor, brake).
parent(ac, series).
parent(door, series).
parent(horn, series).
parent(brake, series).
parent(traction, series).
parent(wiper, series).
parent(speedometer, series).

node(server_and_application).	node(static_inverter).
node(railway).					node(compressor).
node(suspension).				node(door).
node(emergency).				node(horn).
node(mg).						node(brake).
node(service_table).			node(ac).
node(switch).					node(series).
node(signal).					node(wiper).
node(fire).						node(speedometer).
node(fallen_tree).				node(traction).
node(overhead_line).
node(pantograph).

p(server_and_application, 0.001230516817063).
p(railway, 0.038146021328958).
p(suspension, 0.002050861361772).
p(emergency, 0.002871205906481).
p(mg, 0.002871205906481).
p(service_table, 0.002871205906481).
p(fallen_tree, 0.008613617719442).
p(fire, 0.017637407711239).
p(compressor, 0.007793273174733).
p(traction, 0.007793273174733).
p(wiper, 0.002050861361772).
p(speedometer, 	0.001230516817063).

p(static_inverter, [overhead_line], 0.005050505050505).
p(static_inverter, [\+ overhead_line], 0.000213766566909).

p(ac, [static_inverter], 0.5).
p(ac, [\+ static_inverter], 0.029749692244563).

p(door, [compressor], 0.026315789473684).
p(door, [\+ compressor], 0.006821000413394).

p(horn, [compressor], 0.026315789473684).
p(horn, [\+ compressor], 0.000206696982224).

p(brake, [compressor], 0.026315789473684).
p(brake, [\+ compressor], 0.004340636626705).

p(signal, [switch], 0.080952380952381).
p(signal, [\+ switch], 0.061937419631376).

p(switch, [service_table], 0.357142857142857).
p(switch, [\+ service_table], 0.042163718634307).

p(overhead_line, [fire, fallen_tree], 0.5).
p(overhead_line, [\+ fire, fallen_tree], 0.304878048780488).
p(overhead_line, [fire, \+ fallen_tree], 0.005882352941176).
p(overhead_line, [\+ fire, \+ fallen_tree], 0.038850284270373).

p(pantograph, [overhead_line, fallen_tree], 0.038461538461539).
p(pantograph, [\+ overhead_line, fallen_tree], 0.017241379310345).
p(pantograph, [overhead_line, \+ fallen_tree], 0.002702702702703).
p(pantograph, [\+ overhead_line, \+ fallen_tree], 0.004409550440955).

p(series, [speedometer, wiper, traction, brake, horn, door, ac],0.5). %v
p(series, [\+ speedometer, wiper, traction, brake, horn, door, ac],0.5). %v
p(series, [speedometer, \+ wiper, traction, brake, horn, door, ac],0.5). %v
p(series, [\+ speedometer, \+ wiper, traction, brake, horn, door,ac], 0.5). %v
p(series, [speedometer, wiper, \+ traction, brake, horn, door, ac],0.5). %v
p(series, [\+ speedometer, wiper, \+ traction, brake, horn, door,ac], 0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, brake, horn, door,ac], 0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, brake, horn, door,ac], 0.5). %v
p(series, [speedometer, wiper, traction, \+ brake, horn, door, ac], 0.5).%v
p(series, [\+ speedometer, wiper, traction, \+ brake, horn, door, ac], 0.5).%v
p(series, [speedometer, \+ wiper, traction, \+ brake, horn, door, ac], 0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, \+ brake, horn, door,ac], 0.5).%v
p(series, [speedometer, wiper, \+ traction, \+ brake, horn, door,ac], 0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, \+ brake, horn, door,ac], 0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, \+ brake, horn, door,ac], 0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ brake, horn,door, ac], 0.5).%v
p(series, [speedometer, wiper, traction, brake, \+ horn, door, ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, brake, \+ horn, door,ac], 0.5).%v
p(series, [speedometer, \+ wiper, traction, brake, \+ horn, door,ac], 0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, brake, \+ horn, door,ac], 0.5).%v
p(series, [speedometer, wiper, \+ traction, brake, \+ horn, door,ac], 0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, brake, \+ horn, door,ac], 0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, brake, \+ horn, door,ac], 0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, brake, \+ horn, door, ac], 0.5).%v
p(series, [speedometer, wiper, traction, \+ brake, \+ horn, door,ac], 0.5).%v
p(series, [\+ speedometer, wiper, traction, \+ brake, \+ horn, door, ac], 0.5).%v
p(series, [speedometer, \+ wiper, traction, \+ brake, \+ horn, door, ac], 0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, \+ brake, \+ horn, door, ac], 0.5).%v
p(series, [speedometer, wiper, \+ traction, \+ brake, \+ horn, door, ac], 0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, \+ brake, \+ horn, door, ac], 0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, \+ brake, \+ horn, door, ac], 0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ brake, \+ horn, door, ac], 0.003875968992248).%v
p(series, [speedometer, wiper, traction, brake, horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, brake, horn, \+ door, ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, brake, horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, brake, horn, \+ door, ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, brake, horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, brake, horn, \+ door, ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, brake, horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, brake, horn, \+ door, ac],0.5).%v
p(series, [speedometer, wiper, traction, \+ brake, horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, \+ brake, horn, \+ door, ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, \+ brake, horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, \+ brake, horn, \+ door, ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, \+ brake, horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, \+ brake, horn, \+ door, ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, \+ brake, horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ brake, horn, \+ door, ac],0.5).%v
p(series, [speedometer, wiper, traction, brake, \+horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, brake, \+horn, \+ door, ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, brake, \+horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, brake, \+horn, \+ door, ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, brake, \+horn, \+ door, ac],0.5). %v
p(series, [\+ speedometer, wiper, \+ traction, brake, \+horn, \+ door, ac],0.5). %v
p(series, [speedometer, \+ wiper, \+ traction, brake, \+horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, brake, \+horn, \+ door, ac],0.5).%v
p(series, [speedometer, wiper, traction, \+ brake, \+ horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, \+ brake, \+ horn, \+ door, ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, \+ brake, \+ horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, \+ brake, \+ horn, \+ door, ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, \+ brake, \+ horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, \+ brake, \+ horn, \+ door, ac],0.5).%
p(series, [speedometer, \+ wiper, \+ traction, \+ brake, \+ horn, \+ door, ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ brake, \+ horn, \+ door, ac], 0.085806739567061).%v
p(series, [speedometer, wiper, traction, brake, horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, brake, horn, door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, brake, horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, brake, horn, door, \+ ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, brake, horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, brake, horn, door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, brake, horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, brake, horn, door, \+ ac],0.5).%v
p(series, [speedometer, wiper, traction, \+ brake, horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, \+ brake, horn, door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, \+ brake, horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, \+ brake, horn, door, \+ ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, \+ brake, horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, \+ brake, horn, door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, \+ brake, horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ brake, horn, door, \+ ac],0.5).%v
p(series, [speedometer, wiper, traction, brake, \+ horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, brake, \+ horn, door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, brake, \+ horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, brake, \+ horn, door, \+ ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, brake, \+ horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, brake, \+ horn, door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, brake, \+ horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, brake, \+ horn, door, \+ ac],0.5).%v
p(series, [speedometer, wiper, traction, \+ brake, \+ horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, \+ brake, \+ horn, door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, \+ brake, \+ horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, \+ brake, \+ horn, door, \+ ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, \+ brake, \+ horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, \+ brake, \+ horn, door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, \+ brake, \+ horn, door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ brake, \+ horn, door, \+ ac],0.428651059085842).%v
p(series, [speedometer, wiper, traction, brake, horn, \+ door, \+ ac], 0.5).%v
p(series, [\+ speedometer, wiper, traction, brake, horn, \+ door, \+ ac], 0.5).%v
p(series, [speedometer, \+ wiper, traction, brake, horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, brake, horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, brake, horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, brake, horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, brake, horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, brake, horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, wiper, traction, \+ brake, horn, \+ door, \+ ac], 0.5).%v
p(series, [\+ speedometer, wiper, traction, \+ brake, horn, \+ door, \+ ac], 0.5).%v
p(series, [speedometer, \+ wiper, traction, \+ brake, horn, \+ door, \+ ac], 0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, \+ brake, horn, \+ door, \+ ac], 0.5).%v
p(series, [speedometer, wiper, \+ traction, \+ brake, horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, \+ brake, horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, \+ brake, horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ brake, horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, wiper, traction, brake, \+ horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, brake, \+ horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, brake, \+ horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, brake, \+ horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, wiper, \+ traction, brake, \+ horn, \+ door, \+ ac], 0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, brake, \+ horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, \+ traction, brake, \+ horn, \+ door, \+ ac],  0.5).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, brake, \+ horn, \+ door, \+ ac], 0.5).%v
p(series, [speedometer, wiper, traction, \+ brake, \+ horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, wiper, traction, \+ brake, \+ horn, \+ door, \+ ac],0.5).%v
p(series, [speedometer, \+ wiper, traction, \+ brake, \+ horn, \+ door, \+ ac],0.5).%v
p(series, [\+ speedometer, \+ wiper, traction, \+ brake, \+ horn, \+ door, \+ ac], 0.33347788378144).%v
p(series, [speedometer, wiper, \+ traction, \+ brake, \+ horn, \+ door, \+ ac], 0.5).%v
p(series, [\+ speedometer, wiper, \+ traction, \+ brake, \+ horn, \+ door, \+ ac], 0.001945525291829).%v
p(series, [speedometer, \+ wiper, \+ traction, \+ brake, \+ horn, \+ door, \+ ac], 0.003875968992248).%v
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ brake, \+ horn, \+ door, \+ ac], 0.080313712261764).%v
