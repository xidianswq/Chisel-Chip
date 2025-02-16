error id: `<none>`.
file:///C:/Users/SWQ2003/Desktop/Chisel-Chip/src/main/scala/gcd/MultiSelect.scala
empty definition using pc, found symbol in pc: `<none>`.
empty definition using semanticdb
|empty definition using fallback
non-local guesses:
	 -Chisel3.sel.
	 -Chisel3.sel#
	 -Chisel3.sel().
	 -Chisel3.experimental.sel.
	 -Chisel3.experimental.sel#
	 -Chisel3.experimental.sel().
	 -sel.
	 -sel#
	 -sel().
	 -scala/Predef.sel.
	 -scala/Predef.sel#
	 -scala/Predef.sel().

Document text:

```scala
package test

import Chisel3._
import Chisel3.experimental._

class MultiSelect extends Module{
    val io=IO(new Bundle{
        val in=Input(Vec(8,UInt(8.W)))
        val sel=Input(UInt(3.W))
        val out=Output(UInt(8.W))
    })
    io.out:=io.in(io.sel)
}
```

#### Short summary: 

empty definition using pc, found symbol in pc: `<none>`.