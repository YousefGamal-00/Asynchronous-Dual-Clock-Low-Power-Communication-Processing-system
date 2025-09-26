module CLK_GATE 
(
    input   wire CLK      ,
    input   wire CLK_EN   ,
    input   wire test_en  ,
    output  wire GATED_CLK
);

// //internal connections
// reg Latch_Out ;

// //latch (Level Sensitive Device)
// always @(CLK or CLK_EN)
//  begin
//   if(!CLK)      // active low
//    begin
//     Latch_Out <= CLK_EN ;
//    end
//  end
 
// // ANDING
// assign  GATED_CLK = CLK && Latch_Out ;


TLATNCAX12M U0_TLATNCAX12M 
(
    .CK(CLK)              ,
    .ECK(GATED_CLK)       , 
    .E(CLK_EN || test_en)      
);


endmodule