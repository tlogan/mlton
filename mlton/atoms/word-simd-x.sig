(* Copyright (C) 2009 Matthew Fluet.
 * Copyright (C) 2004-2006 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 *
 * MLton is released under a BSD-style license.
 * See the file MLton-LICENSE for details.
 *)

signature WORD_SIMD_X_STRUCTS = 
   sig
      structure WordSimdSize: WORD_SIMD_SIZE
      structure WordX: WORD_X
   end

signature WORD_SIMD_X = 
   sig
      include WORD_SIMD_X_STRUCTS
   end
