# README

### Specifications for Instruction memory (BRAM module)

| Name              | Instruction_Memory |
| ----------------- | ------------------ |
| Memory Type       | Single Port ROM    |
| 32-Bit Addressing | Enabled            |
| Write Width       | 32 bits            |
| Write Depth       | 1024               |
| Enable            | Always Enabled     |
| COE File          | instructions.coe   |



### Specifications for Data memory (BRAM module)

| Name              | Data_Memory     |
| ----------------- | --------------- |
| Memory Type       | Single Port RAM |
| 32-Bit Addressing | Disabled        |
| Write Width       | 32 bits         |
| Write Depth       | 1024            |
| Enable            | Use ENA pin     |
| COE File          | data.coe        |

### Running the Simulation

Once the “instructions.coe” and “data.coe” are loaded into the instruction memory, you should simulate “test_CPU.v”. The simulation would not have completed within 1,000,000 ps. So in the console, please enter “run 1000 ns”.

You can tell the simulation is done when the instruction printed in the console is NOP (“00000000000000000000000000000000”).
To check the result, hover over the Memory tab, on the left panel. Select Data_Memory. Change Value Radix to Decimal.
It should be like the following.

![img](https://lh4.googleusercontent.com/xKN7P3dfgKocm49mMt29S1bgIicPX14N1geO7QezRp8zUaP0Yrb3IQ4YlMt3um8SlJvRu2QuMIiQGl9HdMP6SAH-WMswgvRZRsqkK6BHD_W-QFWxHHgVmDxt5tciz1p_c_PTsFM)
The arguments to the program are stored in the first two memory slots in the Data Memory (loaded with data.coe).
Once the program is executed, the third memory slot is filled with the GCD of the first two numbers.

### Assembler

We have coded a simple assembler in python. 

Usage

```bash
python assembler.py <asm file>
```

"instructions.coe" file will be generated.

We have already assembled "gcd.asm" into "instructions.coe". So, just load into instruction memory.