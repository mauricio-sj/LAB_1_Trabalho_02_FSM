module FSM(clk, rst, inp, outp);
    input clk, rst, inp;
    output reg outp;
    reg [1:0] state;
    reg [1:0] next_state;

    parameter a = 2'b00;
    parameter b = 2'b01;
    parameter c = 2'b10;
    parameter d = 2'b11;


    always @(posedge clk, posedge rst)
    begin
        if(rst==1'b1)
        begin
				state<=a; //state A
        end
	else
	begin
		state<=next_state;
	end
    end

    always @(inp, state)
    begin
	 
        next_state=a;
        outp = 1'b0;

        case(state)
            a:
            begin
                if(inp==1'b1)
                begin
                    next_state=b;
						  outp = 1'b0;
                end
                else
                begin
                    next_state=a;
						  outp = 1'b0;
                end
            end
            b:
            begin
                if(inp==1'b1)
                begin
                    next_state=c;
						  outp = 1'b0;
                end
                else
                begin
                    next_state=a;
						  outp = 1'b0;
                end
            end
            c:
            begin
                if(inp==1'b1)
                begin
                    next_state=d;
                    outp = 1'b0;
                end
                else
                begin
                    next_state=a;
						  outp = 1'b1;
                end
            end

            d:
            begin
                if(inp==1'b0)
                begin
                    next_state=a;
						  outp = 1'b0;
                end
                else
                begin
                    next_state=d;
						  outp = 1'b0;
                end
            end
            default:
            begin
                next_state=a;
                outp = 1'b0;
            end
        endcase
    end
	 


 

endmodule