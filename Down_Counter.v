module Down_Counter (
input wire [3:0] IN,
input wire latch,
input wire dec,
input wire clk,
output wire zero,
output reg [3:0] counter
);

always @ (posedge clk)
 begin
  if (latch)
   begin
    counter <= IN;           //if latch is high, the value is loaded
   end
  else if (dec && !zero)             //if dec is high and zero flag is low, the value in decremented
   begin
    counter <= counter - 4'b0001;
   end
 end
   
assign zero = (counter == 4'b0000);    //if the value is zero, zero flag is high

endmodule