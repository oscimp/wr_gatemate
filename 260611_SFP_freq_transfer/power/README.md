# Drive power dependence of the 1Gb SFP phase noise

R&S SMA100A at various power, and OCXO, driving the emitting SFP and
receiving SFP output connected to phase station.

Direct reference and output to the Phase Station (no mixer), DUT=DUT, REF=REF

Execute
```
gunzip *tim
octave plot_tim.m
```

<a href="power_dependence.png">
