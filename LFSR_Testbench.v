`timescale 1ns/1ps

module LFSR_Testbench;
    
    // Inputs to the LFSR
    reg clk;
    reg rst;
    reg load;
    reg enable;
    reg [7:0] load_data;

    // Output from the LFSR
    wire sequence;

    // Instantiate the LFSR module
    LFSR uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .load_data(load_data),
        .enable(enable),
        .sequence(sequence)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Task for running an experiment
    task run_experiment;
        input [7:0] init_state;
        input integer cycles;
        integer i;
        begin
            // Load the initial state
            @(posedge clk);
            load_data = init_state;
            load = 1;
            enable = 0;
            @(posedge clk);
            load = 0; // Disable load to start running

            // Enable and run LFSR for specified cycles
            enable = 1;
            for (i = 0; i < cycles; i = i + 1) begin
                @(posedge clk);
                $display("Cycle %0d: Output = %b", i, sequence);
            end

            // Disable LFSR operation
            enable = 0;
        end
    endtask

    // Testbench procedure
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        load = 0;
        enable = 0;
        load_data = 8'b0;

        // Reset LFSR
        @(posedge clk);
        rst = 1;
        @(posedge clk);
        rst = 0;

        // Experiment 1: Initial state 00000001, 15 output elements
        $display("Starting Experiment 1:");
        run_experiment(8'b00000001, 15);

        // Experiment 2: Initial state 01001001, 8 output elements
        $display("\nStarting Experiment 2:");
        run_experiment(8'b01001001, 8);

        // Idle for 5 clock cycles
        $display("Idling for 5 cycles...");
        for (int j = 0; j < 5; j = j + 1) begin
            @(posedge clk);
            $display("Idle Cycle %0d", j);
        end

        // Reload with initial state 00000001 and produce 5 more elements
        $display("Reloading and producing 5 more elements:");
        run_experiment(8'b00000001, 5);

        // End of simulation
        $display("Simulation Complete.");
        $stop;
    end

endmodule
