# Network analyzer characterization

S21 transfer function to check the operating frequency range (50 to 2000 MHz):

<img src="1-2S21.png">

<img src="IMG_20260611_094634_775.jpg">

Executing ``plot_tim.m`` in the ``brand/`` subdirectory hints at the
jitter introduced by the two SFPs converting from electrical to optical
signal and back to optical:
```
filename = SFPOtherredAxcenTX_blueFSRX_100MHznmixer_measure_p3dBmend.tim
noweight = 1.7617e-12
withweight = 1.2938e-12
filename = SFPredAxcenTX_blueFSRX_100MHznmixer_measure_p3dBm.tim
noweight = 8.7231e-13
withweight = 6.1683e-13
filename = SFPredAxcenTX_blueFSRX_100MHznmixer_measure_p3dBmend.tim
noweight = 8.9826e-13
withweight = 6.3518e-13
```
so a contribution in the 0.6 to 2 ps range.
