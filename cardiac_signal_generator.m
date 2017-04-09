slCharacterEncoding('UTF-8');
clear all;
close all;

T = 10; 			% Periodo de la señal cardíaca en segundos.
S = 100; 			% Cantidad de muestras de la señal.
noise_weight = 0.15; % Peso del ruido.

file_id = fopen('cardiac_signal.txt','w');
fprintf(file_id,'x,y\n');

% GRAFICO LA SEÑAL
h = figure;
for k=0:T-1
	t = linspace(k,k+1,S);

	% Obtengo la señal
 	signal = signal_mode(t,k);
	
	% Agrego ruido.
	noise = noise_weight*(rand(1,S)-0.5);
	signal = signal + noise;
	
	% Ploteo la señal.
	hold on;
	plot(t,signal);

	t

	% Exporto la información
	for n=1:length(t)-1
		fprintf(file_id,'%d,%d\n', t(1,n),signal(1,n));
	end
end

% CONFIGURO EL GRAFICO
xlim([0 T]);
ylim([-1 3]);
box on;
title('Cardiac Signal');
xlabel('Time [s]');
ylabel('Amplitude of x(t) [V]');

fclose(file_id);

return