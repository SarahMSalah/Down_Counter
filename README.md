Description
This project contains a 4-bit synchronous down counter written in Verilog. The counter can load an input value, decrement on each clock pulse, and raise a flag when the counter reaches zero.

Module: Down_Counter
Inputs
•	IN [3:0] – 4-bit value to load into the counter.
•	latch – When high, the value of IN is loaded into the counter on the rising edge of the clock.
•	dec – When high, the counter decrements by 1 on each clock edge (as long as the counter is not already zero).
•	clk – Clock signal, positive edge triggered.
Outputs
•	counter [3:0] – The current value of the counter.
•	zero – A flag that goes high when the counter reaches zero.

Functionality
•	When latch is set to 1, the counter loads the input value IN.
•	When dec is set to 1 and the counter has not yet reached zero, the counter decrements by 1 on each rising clock edge.
•	Once the counter reaches 0000, the zero output goes high.

Testbench: Down_Counter_tb
The included testbench verifies the counter’s functionality. It performs four tests:
•	Test 1: Latch operation – ensures the counter correctly loads the input value.
•	Test 2: Latch priority – verifies that latch has priority when both latch and dec are high.
•	Test 3: Decrement operation – ensures the counter decrements correctly.
•	Test 4: Decrement until zero – verifies the counter counts down to zero and sets the zero flag.
Simulation also generates a VCD waveform file (Down_Counter_tb.vcd).

Waveform Screenshots  
- **Waveform_Test1:** Latch operation  
  ![Waveform Test 1](Waveform_Test%201.png)  
- **Waveform_Test2:** Latch priority  
  ![Waveform Test 2](Waveform_Test%202.png)  
- **Waveform_Test3:** Counter decrementing  
  ![Waveform Test 3](Waveform_Test%203.png)  
- **Waveform_Test4:** Counter reaches zero and `zero` flag goes high  
  ![Waveform Test 4](Waveform_Test%204.png) 
