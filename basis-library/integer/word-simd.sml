(* Copyright (C) 2013 Matthew Fluet.
 * Copyright (C) 1999-2007 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 * Copyright (C) 1997-2000 NEC Research Institute.
 *
 * MLton is released under a BSD-style license.
 * See the file MLton-LICENSE for details.
 *)


functor WordSimd (S: WORD_SIMD_STRUCTS) : WORD_SIMD = struct
  open S
  open WS

  val toVector = fn simd => (
    let
      val arr: word array = Array.array (simdSize, W.fromInt 0)
      val _ = toArray (simd, arr)
    in
      Array.vector arr
    end
  )

  val thirtyTwos = WS.fromVector (Vector.tabulate (simdSize, fn _ => W.fromInt 32))

  fun << (is, ns) = let
    (* simd with 0 = false, -1 = true *)
    val neg_cs = WS.<= (ns, thirtyTwos)
    (* multiply by self so -1 becomes 1, 0 stays 0*)  
    val pos_cs = WS.* (neg_cs, neg_cs) 
  in
    WS.* (WS.<<? (is, ns), pos_cs)
  end 


  (* TO DO: make safe *)
  fun div (m, n) = WS.quotUnsafe (m, n)
  fun mod (m, n) = WS.remUnsafe (m, n)
  fun >> (is, ns) = WS.>>? (is, ns)
  fun ~>> (is, ns) = WS.~>>? (is, ns)
  fun rol (is, ns) = WS.rolUnsafe (is, ns)
  fun ror (is, ns) = WS.rorUnsafe (is, ns)

end

(*
structure WordSimd8x16 = WordSimd (
    structure WS = Primitive.WordSimd8x16
    structure W = Word8 
) 

structure WordSimd16x8 = WordSimd (
    structure WS = Primitive.WordSimd16x8
    structure W = Word16 
) 
*)

structure WordSimd32x4 = WordSimd (
    structure WS = Primitive.WordSimd32x4
    structure W = Word32 
) 

(*

structure WordSimd64x2 = WordSimd (
    structure WS = Primitive.WordSimd64x2
    structure W = Word64 
) 
*)

