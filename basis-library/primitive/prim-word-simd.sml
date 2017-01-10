(* Copyright (C) 1999-2007 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 * Copyright (C) 1997-2000 NEC Research Institute.
 *
 * MLton is released under a BSD-style license.
 * See the file MLton-LICENSE for details.
 *)

(* Primitive names are special -- see atoms/prim.fun. *)

signature PRIM_WORD_SIMD = sig
  eqtype wordSimd 
  type t = wordSimd
  type word 

  val simdSize : Primitive.Int32.int

  val + : wordSimd * wordSimd -> wordSimd
  val andb : wordSimd * wordSimd -> wordSimd;  

  val >= : wordSimd * wordSimd -> wordSimd;
  val > : wordSimd * wordSimd -> wordSimd;
  val <= : wordSimd * wordSimd -> wordSimd;
  val < : wordSimd * wordSimd -> wordSimd;

  val <<? : wordSimd * wordSimd -> wordSimd;
  val * : wordSimd * wordSimd -> wordSimd;
  val ~ : wordSimd -> wordSimd;
  val notb : wordSimd -> wordSimd;
  val orb : wordSimd * wordSimd -> wordSimd;
  val quotUnsafe : wordSimd * wordSimd -> wordSimd;
  val remUnsafe : wordSimd * wordSimd -> wordSimd;
  val rolUnsafe : wordSimd * wordSimd -> wordSimd;
  val rorUnsafe : wordSimd * wordSimd -> wordSimd;
  val ~>>? : wordSimd * wordSimd -> wordSimd;
  val >>? : wordSimd * wordSimd -> wordSimd;
  val - : wordSimd * wordSimd -> wordSimd;
  val xorb : wordSimd * wordSimd -> wordSimd;

  val fromVector : word vector -> wordSimd
  val toArray : wordSimd * word array -> unit

end

structure Primitive = struct

  open Primitive

  structure WordSimd8x16 : PRIM_WORD_SIMD = struct
    open WordSimd8x16

    type word = Word8.word
    val simdSize = 16


    val + = _prim "WordSimd8x16_add" : wordSimd * wordSimd -> wordSimd;
    val andb = _prim "WordSimd8x16_andb": wordSimd * wordSimd -> wordSimd;  
    val equal = _prim "WordSimd8x16_equal": wordSimd * wordSimd -> wordSimd;  

    val >= = _prim "WordSimdU8x16_ge": wordSimd * wordSimd -> wordSimd;
    val > = _prim "WordSimdU8x16_gt": wordSimd * wordSimd -> wordSimd;
    val <= = _prim "WordSimdU8x16_le": wordSimd * wordSimd -> wordSimd;
    val < = _prim "WordSimdU8x16_lt": wordSimd * wordSimd -> wordSimd;

    val <<? = _prim "WordSimd8x16_lshift": wordSimd * wordSimd -> wordSimd;
    val * = _prim "WordSimdU8x16_mul" : wordSimd * wordSimd -> wordSimd;  
    val ~ = _prim "WordSimd8x16_neg" : wordSimd -> wordSimd;
    val notb = _prim "WordSimd8x16_notb": wordSimd -> wordSimd;  
    val orb = _prim "WordSimd8x16_orb" : wordSimd * wordSimd -> wordSimd;
    val quotUnsafe = _prim "WordSimdU8x16_quot" : wordSimd * wordSimd -> wordSimd;  
    val remUnsafe = _prim "WordSimdU8x16_rem" : wordSimd * wordSimd -> wordSimd;  
    val rolUnsafe = _prim "WordSimd8x16_rol": wordSimd * wordSimd -> wordSimd;
    val rorUnsafe = _prim "WordSimd8x16_ror": wordSimd * wordSimd -> wordSimd;
    val ~>>? = _prim "WordSimdS8x16_rshift": wordSimd * wordSimd -> wordSimd;
    val >>? = _prim "WordSimdU8x16_rshift": wordSimd * wordSimd -> wordSimd;
    val - = _prim "WordSimd8x16_sub" : wordSimd * wordSimd -> wordSimd;       
    val xorb = _prim "WordSimd8x16_xorb": wordSimd * wordSimd -> wordSimd;

    val fromVector = _prim "WordSimd8x16_fromVector": word vector -> wordSimd;
    val toArray = _prim "WordSimd8x16_toArray": wordSimd * word array -> unit;

  end

  structure WordSimd16x8 : PRIM_WORD_SIMD = struct
    open WordSimd16x8

    type word = Word16.word
    val simdSize = 8 

    val + = _prim "WordSimd16x8_add" : wordSimd * wordSimd -> wordSimd;
    val andb = _prim "WordSimd16x8_andb": wordSimd * wordSimd -> wordSimd;  
    val equal = _prim "WordSimd16x8_equal": wordSimd * wordSimd -> wordSimd;  

    val >= = _prim "WordSimdU16x8_ge": wordSimd * wordSimd -> wordSimd;
    val > = _prim "WordSimdU16x8_gt": wordSimd * wordSimd -> wordSimd;
    val <= = _prim "WordSimdU16x8_le": wordSimd * wordSimd -> wordSimd;
    val < = _prim "WordSimdU16x8_lt": wordSimd * wordSimd -> wordSimd;

    val <<? = _prim "WordSimd16x8_lshift": wordSimd * wordSimd -> wordSimd;
    val * = _prim "WordSimdU16x8_mul" : wordSimd * wordSimd -> wordSimd;  
    val ~ = _prim "WordSimd16x8_neg" : wordSimd -> wordSimd;
    val notb = _prim "WordSimd16x8_notb": wordSimd -> wordSimd;  
    val orb = _prim "WordSimd16x8_orb" : wordSimd * wordSimd -> wordSimd;
    val quotUnsafe = _prim "WordSimdU16x8_quot" : wordSimd * wordSimd -> wordSimd;  
    val remUnsafe = _prim "WordSimdU16x8_rem" : wordSimd * wordSimd -> wordSimd;  
    val rolUnsafe = _prim "WordSimd16x8_rol": wordSimd * wordSimd -> wordSimd;
    val rorUnsafe = _prim "WordSimd16x8_ror": wordSimd * wordSimd -> wordSimd;
    val ~>>? = _prim "WordSimdS16x8_rshift": wordSimd * wordSimd -> wordSimd;
    val >>? = _prim "WordSimdU16x8_rshift": wordSimd * wordSimd -> wordSimd;
    val - = _prim "WordSimd16x8_sub" : wordSimd * wordSimd -> wordSimd;       
    val xorb = _prim "WordSimd16x8_xorb": wordSimd * wordSimd -> wordSimd;

    val ~ = _prim "WordSimd16x8_neg" : wordSimd -> wordSimd;
    val notb = _prim "WordSimd16x8_notb": wordSimd -> wordSimd;  

    val fromVector = _prim "WordSimd16x8_fromVector": word vector -> wordSimd;
    val toArray = _prim "WordSimd16x8_toArray": wordSimd * word array -> unit;

  end

  structure WordSimd32x4 : PRIM_WORD_SIMD = struct
    open WordSimd32x4

    type word = Word32.word
    val simdSize = 4 

    val + = _prim "WordSimd32x4_add" : wordSimd * wordSimd -> wordSimd;
    val andb = _prim "WordSimd32x4_andb": wordSimd * wordSimd -> wordSimd;  
    val equal = _prim "WordSimd32x4_equal": wordSimd * wordSimd -> wordSimd;  

    val >= = _prim "WordSimdU32x4_ge": wordSimd * wordSimd -> wordSimd;
    val > = _prim "WordSimdU32x4_gt": wordSimd * wordSimd -> wordSimd;
    val <= = _prim "WordSimdU32x4_le": wordSimd * wordSimd -> wordSimd;
    val < = _prim "WordSimdU32x4_lt": wordSimd * wordSimd -> wordSimd;

    val <<? = _prim "WordSimd32x4_lshift": wordSimd * wordSimd -> wordSimd;
    val * = _prim "WordSimdU32x4_mul" : wordSimd * wordSimd -> wordSimd;  
    val ~ = _prim "WordSimd32x4_neg" : wordSimd -> wordSimd;
    val notb = _prim "WordSimd32x4_notb": wordSimd -> wordSimd;  
    val orb = _prim "WordSimd32x4_orb" : wordSimd * wordSimd -> wordSimd;
    val quotUnsafe = _prim "WordSimdU32x4_quot" : wordSimd * wordSimd -> wordSimd;  
    val remUnsafe = _prim "WordSimdU32x4_rem" : wordSimd * wordSimd -> wordSimd;  
    val rolUnsafe = _prim "WordSimd32x4_rol": wordSimd * wordSimd -> wordSimd;
    val rorUnsafe = _prim "WordSimd32x4_ror": wordSimd * wordSimd -> wordSimd;
    val ~>>? = _prim "WordSimdS32x4_rshift": wordSimd * wordSimd -> wordSimd;
    val >>? = _prim "WordSimdU32x4_rshift": wordSimd * wordSimd -> wordSimd;
    val - = _prim "WordSimd32x4_sub" : wordSimd * wordSimd -> wordSimd;       
    val xorb = _prim "WordSimd32x4_xorb": wordSimd * wordSimd -> wordSimd;

    val fromVector = _prim "WordSimd32x4_fromVector": word vector ->wordSimd;
    val toArray = _prim "WordSimd32x4_toArray": wordSimd * word array -> unit;

  end

  structure WordSimd64x2 : PRIM_WORD_SIMD = struct
    open WordSimd64x2

    type word = Word64.word
    val simdSize = 2 

    val + = _prim "WordSimd64x2_add" : wordSimd * wordSimd -> wordSimd;
    val andb = _prim "WordSimd64x2_andb": wordSimd * wordSimd -> wordSimd;  
    val equal = _prim "WordSimd64x2_equal": wordSimd * wordSimd -> wordSimd;  

    val >= = _prim "WordSimdU64x2_ge": wordSimd * wordSimd -> wordSimd;
    val > = _prim "WordSimdU64x2_gt": wordSimd * wordSimd -> wordSimd;
    val <= = _prim "WordSimdU64x2_le": wordSimd * wordSimd -> wordSimd;
    val < = _prim "WordSimdU64x2_lt": wordSimd * wordSimd -> wordSimd;

    val <<? = _prim "WordSimd64x2_lshift": wordSimd * wordSimd -> wordSimd;
    val * = _prim "WordSimdU64x2_mul" : wordSimd * wordSimd -> wordSimd;  
    val ~ = _prim "WordSimd64x2_neg" : wordSimd -> wordSimd;
    val notb = _prim "WordSimd64x2_notb": wordSimd -> wordSimd;  
    val orb = _prim "WordSimd64x2_orb" : wordSimd * wordSimd -> wordSimd;
    val quotUnsafe = _prim "WordSimdU64x2_quot" : wordSimd * wordSimd -> wordSimd;  
    val remUnsafe = _prim "WordSimdU64x2_rem" : wordSimd * wordSimd -> wordSimd;  
    val rolUnsafe = _prim "WordSimd64x2_rol": wordSimd * wordSimd -> wordSimd;
    val rorUnsafe = _prim "WordSimd64x2_ror": wordSimd * wordSimd -> wordSimd;
    val ~>>? = _prim "WordSimdS64x2_rshift": wordSimd * wordSimd -> wordSimd;
    val >>? = _prim "WordSimdU64x2_rshift": wordSimd * wordSimd -> wordSimd;
    val - = _prim "WordSimd64x2_sub" : wordSimd * wordSimd -> wordSimd;       
    val xorb = _prim "WordSimd64x2_xorb": wordSimd * wordSimd -> wordSimd;

    val fromVector = _prim "WordSimd64x2_fromVector": word vector ->wordSimd;
    val toArray = _prim "WordSimd64x2_toArray": wordSimd * word array -> unit;

  end

end

