[x,fval] = simulannealbnd(@objfunc,0,-pi,pi)

options = optimoptions(@simulannealbnd,'MaxIterations',300)
x1 = simulannealbnd(@objfunc,0,-pi,pi,options)

options = optimoptions(@simulannealbnd,'TemperatureFcn','temperatureboltz');
x2 = simulannealbnd(@objfunc,0,-pi,pi,options)

options = optimoptions(@simulannealbnd,'TemperatureFcn','temperaturefast');
x3 = simulannealbnd(@objfunc,0,-pi,pi,options)

options = optimoptions(@simulannealbnd,'TemperatureFcn','temperatureexp');
x4 = simulannealbnd(@objfunc,0,-pi,pi,options)

options = optimoptions(@simulannealbnd,'InitialTemperature',1000);
x5 = simulannealbnd(@objfunc,0,-pi,pi,options)
