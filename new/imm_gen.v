module imm_gen(
    input [31:0] in,
    output reg [31:0] imm

);
    always @ (in) begin
        // S_type:store
        if (in[6:0] == 7'b0100011) begin 
            imm = {{20{in[31]}}, in[31:25], in[11:7]};
        end
        // I_type:load
        else if(in[6:0] == 7'b0000011) begin
            imm = {{20{in[31]}}, in[31:20]};
        end
        // I_type:arith
        else if(in[6:0] == 7'b0010011) begin
            if (in[14:12] == 3'b001 || in[14:12] == 3'b101) begin
                imm = {27'b0, in[24:20]};
            end 
            else begin
                imm = {{20{in[31]}}, in[31:20]}; // other part
            end
        end
        // I_type:jalr
        else if(in[6:0] == 7'b1100111) begin
            imm = {{20{in[31]}},in[31:20]};
        end
        // B_type:branch
        else if(in[6:0] == 7'b1100011) begin
            imm = {{19{in[31]}}, in[31], in[7], in[30:25], in[11:8], 1'b0};
        end
        // U_type:lui, auipc
        else if(in[6:0] == 7'b0110111 || in[6:0] == 7'b0010111) begin
            imm = {in[31:12], 12'b0};
        end
        // J_type:jal
        else if(in[6:0] == 7'b1101111) begin
            imm = {{11{in[31]}}, in[31], in[19:12], in[20], in[30:21], 1'b0};
        end
        // R_type: no imm needed
        else if (in[6:0] == 7'b0110011) begin
            imm = 32'b0;
        end
    end
endmodule
