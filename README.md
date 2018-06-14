# Simple DC Compiler Project

[![Join the chat at https://gitter.im/DCC_Basic/Lobby](https://badges.gitter.im/DCC_Basic/Lobby.svg)](https://gitter.im/DCC_Basic/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This is a very basic project to get started with DC Compiler (non-ultra) design flow.

## How to run? 

Make sure you have access to the [ref](https://github.com/parthpower/ref) repo.

```
git clone --recursive https://github.com/parthpower/DCC_Basic.git
cd DCC_Basic
make
```

## Script Structure

[setup_lib.tcl](script/setup_lib.tcl) setups all library paths and environment variables required.

[constraint.con](script/constraint.con) applies the constraints to the design.

[dc_script.tcl](script/dc_script.tcl) is the main script which invokes the other two scripts.


_Comment the [`exit`](https://github.com/parthpower/DCC_Basic/blob/e24a6d31dad73f4e95827a1b6b3b1b48e09cab53/script/dc_script.tcl#L42-43) at the end of the [dc_script.tcl](script/dc_script.tcl) if you want to run DC Compiler in interactive mode once script is executed. It is included to help the Contineous Integration flow._

__Note__: The [ref](https://github.com/parthpower/ref) is a private repo which includes all the library files.
