module seg_disp( 
input c,
input [7:0] wdata,
output reg [7:0] seg 
);

    always @( c, wdata )
    begin
        seg[7] <= c;
        if ( c == 1'b0 ) begin
            case (wdata[3:0])
                4'h0 : seg[6:0] <= 7'b0111111;
                4'h1 : seg[6:0] <= 7'b0000110;
                4'h2 : seg[6:0] <= 7'b1011011;
                4'h3 : seg[6:0] <= 7'b1001111;
                4'h4 : seg[6:0] <= 7'b1100110;
                4'h5 : seg[6:0] <= 7'b1101101;
                4'h6 : seg[6:0] <= 7'b1111101;
                4'h7 : seg[6:0] <= 7'b0100111;                
                4'h8 : seg[6:0] <= 7'b1111111;
                4'h9 : seg[6:0] <= 7'b1101111;
                4'ha : seg[6:0] <= 7'b1110111;
                4'hb : seg[6:0] <= 7'b1111100;
                4'hc : seg[6:0] <= 7'b0111001;
                4'hd : seg[6:0] <= 7'b1011110;
                4'he : seg[6:0] <= 7'b1111001;
                4'hf : seg[6:0] <= 7'b1110001;
                default : seg[6:0] <= 7'b0111111;
            endcase
        end
        else begin
            case (wdata[7:4])
                4'h0 : seg[6:0] <= 7'b0111111;
                4'h1 : seg[6:0] <= 7'b0000110;
                4'h2 : seg[6:0] <= 7'b1011011;
                4'h3 : seg[6:0] <= 7'b1001111;
                4'h4 : seg[6:0] <= 7'b1100110;
                4'h5 : seg[6:0] <= 7'b1101101;
                4'h6 : seg[6:0] <= 7'b1111101;
                4'h7 : seg[6:0] <= 7'b0100111;                
                4'h8 : seg[6:0] <= 7'b1111111;
                4'h9 : seg[6:0] <= 7'b1101111;
                4'ha : seg[6:0] <= 7'b1110111;
                4'hb : seg[6:0] <= 7'b1111100;
                4'hc : seg[6:0] <= 7'b0111001;
                4'hd : seg[6:0] <= 7'b1011110;
                4'he : seg[6:0] <= 7'b1111001;
                4'hf : seg[6:0] <= 7'b1110001;
                default : seg[6:0] <= 7'b0111111;
            endcase
        end  
    end    
endmodule
