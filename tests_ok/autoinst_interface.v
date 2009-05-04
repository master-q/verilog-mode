// See bug75

module autoinst_interface
  (/*AUTOINOUTMODULE("autoinst_interface_sub")*/
   // Beginning of automatic in/out/inouts (from specific module)
   output [7:0]         count,
   input                        clk,
   input                        reset,
   input                        start,
   my_svi.master                my_svi_port,
   my_svi               my_svi_noport
   // End of automatics
   );
endmodule

module autoinst_interface
  (/*AUTOINOUTCOMP("autoinst_interface_sub")*/
   // Beginning of automatic in/out/inouts (from specific module)
   output               clk,
   output               reset,
   output               start,
   input [7:0]          count,
   my_svi.master                my_svi_port,
   my_svi               my_svi_noport
   // End of automatics
   );
endmodule

module top;
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [7:0] count;                    // From submod0 of autoinst_interface_sub.v
   // End of automatics
   autoinst_interface_sub submod0 (/*AUTOINST*/
                                   // Interfaces
                                   .my_svi_port         (my_svi_port),
                                   .my_svi_noport       (my_svi_noport),
                                   // Outputs
                                   .count               (count[7:0]),
                                   // Inputs
                                   .clk                 (clk),
                                   .reset               (reset),
                                   .start               (start));
endmodule
