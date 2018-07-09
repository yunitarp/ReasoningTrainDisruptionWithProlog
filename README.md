# ReasoningTrainDisruptionWithProlog
We reason about disruption pattern for train systems using Bayesian Network and Prolog.
We suggest to run this program using SWI-Prolog version 7.6.1 for better performance.

Here we provide steps by steps how to run this program :
1. Please going to the Prolog Program directory. Then, download all the files in this repository.
2. Extract the .zip file.
3. Go to the directory where the files is extracted, double click/run the "user_interface.pl" files.
4. Consult the "rules.pl", "partwholerelation.pl", and "bayesian_networkN" that you want to reason using the following command :
	consult('rules.pl').
	consult('partholerelation.pl').
	consult('bayesian_network1.pl') %for example if we want to reason the bayesian network 1.
5. type "menu." on the Prolog interpreter.
6. The main menu will appear and just choose the menu number for query you want to answer.
7. Here the list of disruptions' names :
	- ac
	- brake
	- compressor
	- door
	- emergency
	- fallen_tree
	- fire
	- horn
	- mg
	- overhead_line
	- pantograph	
	- railway
	- series
	- service_table
	- server_and_application
	- signal
	- speedometer
	- static_inverter
	- suspension
	- switch
	- traction
	- wiper
# Please type the name of disruptions correctly.

