import numpy as np
from scipy.io import wavfile
from scipy.signal import stft

# Read the wav file (mono)
sampling_rate, data = wavfile.read('horn.wav')

# Perform FFT
fft_out = stft(data)

# Print the first 10 items of the FFT output
print(fft_out[2].shape)