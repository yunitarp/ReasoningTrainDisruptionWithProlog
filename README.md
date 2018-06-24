# ReasoningTrainDisruptionWithProlog
We try to reason about disruption pattern for train systems using Bayesian Network and Prolog.
we suggest to run this program using SWI-Prolog version 7.6.1 for better performance.

Here we provide steps by steps how to run this program :
1. Please download all the files in this repository.
2. Extract the .zip file.
3. Go to the directory where the files is extracted, double click/run the "user_interface.pl" files.
4. Consult the "rules.pl", "partwholerelation.pl", and "bayesian_networkN" that you want try to reason using the following command :
	consult('rules.pl').
	consult('partholerelation.pl').
	consult('bayesian_network1.pl') %for example we want try to reason the bayesian network 1.
5. type "menu." on the Prolog interpreter.
6. The all of menu will appear and just choose the menu number for query you want to see.
7. Here list of name disruptions :
	- server_and_application	- static_inverter
	- railway					- door
	- suspension				- horn
	- emergency					- brake
	- mg						- switch
	- service_table				- overhead_line
	- signal					- pantograph
	- fallen_tree				- series
	- fire
	- compressor
	- traction
	- wiper
	- speedometer
	please type the name of disruptions correctly.

