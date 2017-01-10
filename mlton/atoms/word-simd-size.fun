(* Copyright (C) 2004-2007 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 *
 * MLton is released under a BSD-style license.
 * See the file MLton-LICENSE for details.
 *)

functor WordSimdSize (S: WORD_SIMD_SIZE_STRUCTS): WORD_SIMD_SIZE = struct

  open S

  datatype t = T of Bits.t * int

  fun mk (b: Bits.t, i: int): t = let
    val wordSz = Bits.toInt b
    val simdSz = i 
    
    val wordSzIsPowerOf2 = 
      Word.andb (
        Word.fromInt wordSz
      , Word.fromInt (wordSz - 1)
      ) = (Word.fromInt 0)

    val simdSzIsPowerOf2 = 
      Word.andb (
        Word.fromInt simdSz
      , Word.fromInt (simdSz - 1)
      ) = (Word.fromInt 0)

    val isValid = 
      simdSzIsPowerOf2 andalso wordSzIsPowerOf2
  in
    if isValid then
      T (b, i)
    else
      Error.bug (concat [
        "WordSimdSize.mk: strange sizes: "
      , Bits.toString b
      , " by ", Int.toString i
      ])
      
  end

  val wordSimd8x16 = mk (Bits.fromInt 8, 16)
  val wordSimd16x8 = mk (Bits.fromInt 16, 8)
  val wordSimd32x4 = mk (Bits.fromInt 32, 4)
  val wordSimd64x2 = mk (Bits.fromInt 64, 2)



  val all: t list = [
      wordSimd8x16
    , wordSimd16x8
    , wordSimd32x4
    , wordSimd64x2
  ]

  val allVector = Vector.fromList all

  val prims = all 

  val equals: t * t -> bool = op =

  val memoize: (t -> 'a) -> t -> 'a = fn f => let
    val w8x16 = f wordSimd8x16
    val w16x8 = f wordSimd16x8
    val w32x4 = f wordSimd32x4
    val w64x2 = f wordSimd64x2
  in
    fn T (b, i) => 
      if (Bits.toInt b) = 8 andalso i = 16 then w8x16
      else if (Bits.toInt b) = 16 andalso i = 8 then w16x8
      else if (Bits.toInt b) = 32 andalso i = 4 then w32x4
      else if (Bits.toInt b) = 64 andalso i = 2 then w64x2
      else raise (Error.bug "WordSimdSize.memoize")
  end

  val toString = fn T (b, i) => concat [Bits.toString b, "x", Int.toString i] 

  val wordBits: t -> Bits.t =
    fn T (bits, _) => bits 

  val word = 
    fn T (bits, _) => WordSize.fromBits bits 

  val size: t -> int = fn T (_, sz) => sz 

  fun bits s = let 
    val total = (size s) * Bits.toInt (wordBits s) 
  in
    Bits.fromInt total
  end

end
