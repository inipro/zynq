module user_logic # (
    parameter integer seg_width = 16
)
(
    input s_axi_aclk,
    input s_axi_aresetn,
    input s_axi_wvalid,
    input [seg_width-1:0] s_axi_wdata,
    output [seg_width-1:0] seg
);

    reg [19:0] c1,c2;
         
    always @( posedge s_axi_aclk )
    begin
        c1 <= c1 + 1;
        c2 <= c2 + 1;
    end
    
    seg_disp u1 (
        .c(c1[17]),
        .wdata(s_axi_wdata[7:0]),
        .seg(seg[7:0]) );    
    generate 
        if (seg_width==16) 
            seg_disp u2 (
                .c(c2[17]),
                .wdata(s_axi_wdata[15:8]),
                .seg(seg[15:8]) );
    endgenerate
                    
endmodule
