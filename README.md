# Simple DC Compiler Project

This is a very basic project to get started with DC Compiler (non-ultra) design flow. Also includes PrimeTime project to run static timing analysis.

## How to run? 

Make sure you have access to the [ref](https://github.com/parthpower/ref) repo.

``` sh
git clone --recursive https://github.com/parthpower/DCC_Basic.git
cd DCC_Basic
make
```

## Script Structure

## DC Compiler

### [setup_lib.tcl](script/setup_lib.tcl)
Setups all library paths and environment variables required. Common for all tools.

### [dc_constraints.sdc](script/constraint.sdc) 
The constraint file for DC Compiler.

### [dc_script.tcl](script/dc_script.tcl)
The main script to synthesize design in DC Compiler.

## PrimeTime
### [pt_constraints.sdc](script/pt_constraints.sdc)
The constraint file for PrimeTime.

### [pt_script.tcl](script/pt_script.tcl) 
The script to run PrimeTime.

_Comment the `exit` at the end of the [dc_script.tcl](script/dc_script.tcl) and [pt_script.tcl](script/pt_script.tcl) if you want to run DC Compiler/PrimeTime in interactive mode once script is executed. It is included to help the Contineous Integration flow._

__Note__: The [ref](https://github.com/parthpower/ref) is a private repo which includes all the library files. It will not be made public.
