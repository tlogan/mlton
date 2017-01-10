(* Copyright (C) 2009 Matthew Fluet.
 * Copyright (C) 2004-2007 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 *
 * MLton is released under a BSD-style license.
 * See the file MLton-LICENSE for details.
 *)

signature WORD_SIMD_SIZE_STRUCTS =
   sig
      structure WordSize: WORD_SIZE
   end

signature WORD_SIMD_SIZE =
   sig
      include WORD_SIMD_SIZE_STRUCTS

      type t

      val all: t list
      val word: t -> WordSize.t
      val equals: t * t -> bool
      val memoize: (t -> 'a) -> t -> 'a
      val toString: t -> string
      val size: t -> int
      val wordBits: t -> Bits.t
      val bits: t -> Bits.t
      val wordSimd8x16 : t
      val wordSimd16x8 : t
      val wordSimd32x4 : t
      val wordSimd64x2 : t

   end
