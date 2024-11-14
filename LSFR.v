module LFSR(
    input wire clk,
    input wire rst,           // Reset to clear the registers
    input wire load,          // Load signal to set initial state
    input wire [7:0] load_data, // 8-bit input for initial state
    input wire enable,        // Enable signal to run the LFSR
    output wire sequence      // 1-bit output sequence
);

    reg [7:0] state;

    // Define the feedback based on the polynomial
    wire feedback = state[7] ^ state[6] ^ state[3] ^ state[2] ^ state[1] ^ state[0];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 8'b0; // Clear registers on reset
        end else if (load) begin
            state <= load_data; // Load initial state
        end else if (enable) begin
            // Shift left and feed back
            state <= {state[6:0], feedback};
        end
    end

    assign sequence = state[0]; // Output the least significant bit
endmodule
