close all
clear all

addpath('../octave_scripts/')  
fc=1e8;  % carrier frequency 100 MHz
N=1000;  % interpolation factor

dirlist=dir('*redA*TX*tim');
leg=[];
for dirnum=1:length(dirlist)
  filename=dirlist(dirnum).name
  [freq,Sphi]=read_tim(filename);
  [noweight,withweight]=phase_to_time(fc,N,freq,Sphi)
  semilogx(freq,Sphi+3);hold on
  leg=[leg, """", strrep(strrep(filename,'_',' '),'.tim',''),""","];
end
eval(["legend(",leg(1:end-1),");"]);
xlabel('frequency offset (Hz)')
ylabel('Sphi (dBrad^2/Hz)')
xlim([1e-1 1e6])
grid on
pause
