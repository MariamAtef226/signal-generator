# signal-generator 〰️

### Project Description :page_facing_up:
A general signal generator on matlab that displays results in time domain and asks user if they'd like to further processing on the signal (EX: time shift)

1. When the program starts the program asks the user for the following parameters:
    1. Sampling frequency of signal.
    2. Start and end of time scale
    3. Number of the break points and their positions (i.e. the points that the signal definition rule changes).

    Example: The signal is defined from -2:0 as a DC signal and from 0:2 as ramp the user will enter that the number of break points =1 and the position at t=0.

2. According to the number of break points the program asks the user at each region to enter the specifications of the signal at this region.

3. Display the resulting signal in time domain
4. The program asks the user if he wants to perform any operation on the signal
    1. Amplitude Scaling: scale value.
    2. Time reversal.
    3. Time shift: shift value.
    4. Expanding the signal: expanding value
    5. Compressing the signal: compressing value
    6. None
5. Display the new signal in time domain


### Files Included 	:file_folder:

- signalgenerator.m

### Used Language 💻

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Matlab_Logo.png/667px-Matlab_Logo.png" alt="matlab" width="30" height="30"> __MATLAB__

### Pre-requisites :grey_question:

None

### Author 🖊️

**Mariam Atef Hassan  - January 2022**

<hr>

#### Enjoy :wink:

