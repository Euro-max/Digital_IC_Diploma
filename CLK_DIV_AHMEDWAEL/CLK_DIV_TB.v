`timescale 1ns/1ps

module CLK_DIV_TB;
    reg i_ref_clk, i_rst_n, i_clk_en;
    reg [7:0] i_div_ratio;
    wire o_div_clk;
    
    parameter CLK_PERIOD = 10; 

    CLK_DIV DUT (
        .i_ref_clk(i_ref_clk),
        .i_rst_n(i_rst_n),
        .i_clk_en(i_clk_en),
        .i_div_ratio(i_div_ratio),
        .o_div_clk(o_div_clk)
    );

    // 1. FIX: Force floating point math to get a perfect toggle
    initial begin
        i_ref_clk = 1'b0;
        forever begin
            #(CLK_PERIOD / 2.0) i_ref_clk = ~i_ref_clk; 
        end
    end
    
    // VCD Dumping
    initial begin
        $dumpfile("CLK_DIV.vcd");
        $dumpvars;
    end
    
    task check_period;
        input integer exp_period;
        input [400:1] test_name; 
        time start_time, end_time, measured_period;
        begin
            @(posedge o_div_clk);
            start_time = $time;
            @(posedge o_div_clk);
            end_time = $time;
            measured_period = end_time - start_time;
            
            if (measured_period == exp_period) begin
                $display("[PASS] %0s | Expected Period: %0d ns | Measured Period: %0d ns at time %0t", 
                         test_name, exp_period, measured_period, $time);
            end else begin
                $display("[FAIL] %0s | EXPECTED Period: %0d ns | GOT Period: %0d ns at time %0t", 
                         test_name, exp_period, measured_period, $time);
            end
        end
    endtask

    // Test Vectors
    initial begin
        // SAFE INITIALIZATION
        i_clk_en = 1'b0;
        i_div_ratio = 8'h00;

        // Asynchronous Active-Low Reset Phase
        i_rst_n = 1'b0; 
        #(CLK_PERIOD * 2);
        i_rst_n = 1'b1; 
        #(CLK_PERIOD * 2);  
        
        // =========================================================
        // MAIN TEST SEQUENCE - F/2 (Even divided ratio)
        // =========================================================
        
        i_div_ratio = 8'd2;
        i_clk_en = 1'b1; 
        
        #(CLK_PERIOD * 2);
        
        check_period(CLK_PERIOD * 2, "Divide by 2 (F/2)");

        #(CLK_PERIOD * 4); // Gap between frames

        // =========================================================
        // TESTCASE 2: Back-to-Back F/3 (Odd divided ratio)
        // =========================================================
        
        i_div_ratio = 8'd3;
        
        #(CLK_PERIOD * 2);
        
        check_period(CLK_PERIOD * 3, "Divide by 3 (F/3)");
        
        #(CLK_PERIOD * 4);

        // =========================================================
        // TESTCASE 3: Back-to-Back F/4 (Even divided ratio)
        // =========================================================
        
        i_div_ratio = 8'd4;
        
        #(CLK_PERIOD * 2);
        
        check_period(CLK_PERIOD * 4, "Divide by 4 (F/4)");
        
        #(CLK_PERIOD * 4);

        // =========================================================
        // TESTCASE 4: Back-to-Back F/5 (Odd divided ratio)
        // =========================================================
        
        i_div_ratio = 8'd5;
        
        #(CLK_PERIOD * 2);
        
        check_period(CLK_PERIOD * 5, "Divide by 5 (F/5)");

        #(CLK_PERIOD * 4);

        $display("==================================================");
        $display("   ALL TESTS COMPLETED.");
        $display("==================================================");
        $finish;
    end
endmodule