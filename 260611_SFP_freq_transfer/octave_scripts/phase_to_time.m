function [noweight,withweight]=phase_to_time(fc,N,fF,SdBc)
% fc=1e7; % carrier frequency
% N=1000;  % interpolation factor
% phase noise spectral SdBc @ fF
%fF=  [1    10  100 1000 10000 1e5 1e6 1e7];
%SdBc(:,1)=[-70  -70  -95  -120 -130 -130 -130 -130]; % BC/GM class I
%%%%%%%% interpolate, convert SdBc to SdBrad & integrate over bandwidth bins
  SdBcint=[];
  fFint=[];
  for k=1:length(SdBc(:))-1
     SdBcint=[SdBcint SdBc(k)+(SdBc(k+1)-SdBc(k))/(log10(fF(k+1))-log10(fF(k)))*(linspace(log10(fF(k)),log10(fF(k+1)),N)-log10(fF(k)))];
     fFint=[fFint 10.^(linspace(log10(fF(k)),log10(fF(k+1)),N))];
  end

  SdBrad=SdBcint+3;   % dBc/Hz -> dBrad^2/Hz
  rad=sqrt(10.^(SdBrad(1:end-1)/10).*(fFint(2:end)-fFint(1:end-1))); % dBrad^2/Hz -> rad
  res=rad/2/pi/fc;    % rad -> s
  noweight=sqrt(sum(res.^2));   % integrate noise fluctuations
  % integrate noise fluctuations with weighing function: 1PPS sampled at tau0=+/-0.5 s
  % and H(f)=sin(2*pi*f*tau0) since PPS_{n+1}-PPS_n => H^2(f)=sin(2*pi*f*tau0).^2
  withweight=sqrt(sum((res.^2.*sin(2*pi*fFint(1:end-1)*1/2).^2)));
end
