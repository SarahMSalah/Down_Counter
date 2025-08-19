`timescale 1ns/1ps
module Down_Counter_tb();

reg [3:0] IN_tb;
reg latch_tb;
reg dec_tb;
reg clk_tb;
wire zero_tb;
wire [3:0] counter_tb;


initial
 begin
    $dumpfile("Down_Counter_tb.vcd");
	$dumpvars;                                   //to save waveforms
	
	clk_tb = 1'b0;   
    latch_tb = 1'b0;   
    dec_tb = 1'b0;   
    IN_tb = 4'b1111;
	
    $display("test 1");                          //test latch
    @(negedge clk_tb);
	latch_tb= 1'b1;
	@(negedge clk_tb);
	if (counter_tb == IN_tb)
	 $display ("test 1 is passed with counter value = %0h at simulation time %0t",counter_tb,$time);
	else
	 $display ("test 1 is failed with counter value = %0h at simulation time %0t",counter_tb,$time);
     
	
	$display("test 2");                           //test latch priority
	latch_tb= 1'b1;
	dec_tb = 1'b1;
	@(negedge clk_tb);
	if (counter_tb == 4'b1111)
	 $display ("test 2 is passed with counter value = %0h at simulation time %0t",counter_tb,$time);
	else
	 $display ("test 2 is failed with counter value = %0h at simulation time %0t",counter_tb,$time);
	 
	 
	$display("test 3");                           // test dec
    latch_tb = 1'b0;
    dec_tb   = 1'b1;
    @(negedge clk_tb);
    if (counter_tb == 4'b1110)
      $display ("test 3 is passed with counter value = %0h at simulation time %0t", counter_tb, $time);
    else
      $display ("test 3 is failed with counter value = %0h at simulation time %0t", counter_tb, $time);


    $display("test 4");                            // test dec until zero
    repeat(15) @(negedge clk_tb);
    if (counter_tb == 4'b0000 && zero_tb == 1'b1)
      $display ("test 4 is passed with counter value = %0h at simulation time %0t", counter_tb, $time);
    else
      $display ("test 4 is failed with counter value = %0h at simulation time %0t", counter_tb, $time);
    repeat(5) @(negedge clk_tb);
	
  $stop;
 end

always #5 clk_tb = ~ clk_tb;

Down_Counter DUT (
.clk(clk_tb),            
.IN(IN_tb), 
.latch(latch_tb),   
.dec(dec_tb), 
.counter(counter_tb),    
.zero(zero_tb)
);

endmodule
