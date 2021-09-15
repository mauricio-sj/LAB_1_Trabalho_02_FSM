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
        if(rst==1)
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
        outp = 0;
        case(state)
            a:
            begin
                if(inp==1'b1)
                begin
                    next_state=b;
                end
                else
                begin
                    next_state=a;
                end
            end
            b:
            begin
                if(inp==1'b1)
                begin
                    next_state=c;
                end
                else
                begin
                    next_state=a;
                end
            end
            c:
            begin
                if(inp==1'b1)
                begin
                    next_state=a;
                    outp=1;
                end
                else
                begin
                    next_state=d;
                end
            end

            d:
            begin
                if(inp==1'b0)
                begin
                    next_state=a;
                end
                else
                begin
                    next_state=d;
                end
            end
            default:
            begin
                next_state=a;
                outp = 0;
            end
        endcase
    end
	 


 

endmodule