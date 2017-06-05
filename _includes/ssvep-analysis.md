#### **SSVEP Analysis** ####

I've also developed a package that makes it easier to analyse
steady-state evoked potentials. Primarily because I work with steady-state __visually__ evoked potentials (SSVEPs), it's called [ssvepy](http://www.janfreyberg.com/ssvepy), but it works with any evoked-frequency / frequency-tagging data. Based on MNE-python data structures, you simply initialise a data class with epoched data as well as your stimulation frequencies, and it automatically calculates your signal-to-noise ratio at stimulation frequencies as well as harmonics (and, in the future, intermodulation frequencies).

You can check out the [example notebook](http://www.janfreyberg.com/ssvepy/example.html) in the documentation, where you'll also find the installation instructions.
