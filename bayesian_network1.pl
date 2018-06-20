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


parent(fallen_tree, pantograph).
parent(fallen_tree, overhead_line).
parent(fire, overhead_line).
parent(overhead_line, pantograph).
parent(overhead_line, static_inverter).
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
parent(service_table, switch).
parent(signal, switch).


p(server_and_application, 0.00123).
p(railway, 0.038146021).
p(suspension, 0.002050861).
p(emergency, 0.002871206).
p(mg, 0.002871206).
p(service_table, 0.002871206).
p(signal, 0.062756358).
p(fallen_tree, 0.008613618).
p(fire, 0.017637408).
p(compressor, 0.007793273).
p(traction, 0.007793273).
p(wiper, 0.002050861).
p(speedometer, 0.001230517).

p(static_inverter, [overhead_line], 0.005050505).
p(static_inverter, [\+ overhead_line], 0.000213767).

p(ac, [static_inverter], 0.5).
p(ac, [\+ static_inverter], 0.029749692).

p(door, [compressor], 0.026315789).
p(door, [\+ compressor], 0.006821).

p(horn, [compressor], 0.026315789).
p(horn, [\+ compressor], 0.000206697).

p(brake, [compressor], 0.026315789).
p(brake, [\+ compressor], 0.004340637).

p(switch, [signal, service_table], 0.5).
p(switch, [\+ signal, service_table], 0.346153846).
p(switch, [signal, \+ service_table], 0.054098361).
p(switch, [\+ signal, \+ service_table], 0.041364933).

p(overhead_line, [fire, fallen_tree], 0.5).
p(overhead_line, [fire, \+ fallen_tree], 0.005882353).
p(overhead_line, [\+ fire, fallen_tree], 0.304878049).
p(overhead_line, [\+ fire, \+ fallen_tree], 0.038850284).

p(pantograph, [overhead_line, fallen_tree], 0.038461538).
p(pantograph, [overhead_line, \+ fallen_tree], 0.002702703).
p(pantograph, [\+ overhead_line, fallen_tree], 0.017241379).
p(pantograph, [\+ overhead_line, \+ fallen_tree], 0.00440955).

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


