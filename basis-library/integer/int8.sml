(* Copyright (C) 1999-2002 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 * Copyright (C) 1997-1999 NEC Research Institute.
 *
 * MLton is released under the GNU General Public License (GPL).
 * Please see the file MLton-LICENSE for license information.
 *)
structure Int8: INTEGER_EXTRA =
   Integer
   (structure P = Primitive.Int8
    open P
    val precision' : Int.int = 8
    val maxInt' : int = 0x7f
    val minInt' : int = ~0x80
   )
      

