signature WORD_SIMD_STRUCTS = 
  sig
      structure WS : PRIM_WORD_SIMD
      structure W : WORD

      sharing type WS.word = W.word

  end

signature WORD_SIMD =
   sig
      eqtype wordSimd

      type word
      val simdSize : int

      val + : wordSimd * wordSimd -> wordSimd
      val andb : wordSimd * wordSimd -> wordSimd;  

      val >= : wordSimd * wordSimd -> wordSimd;
      val > : wordSimd * wordSimd -> wordSimd;
      val <= : wordSimd * wordSimd -> wordSimd;
      val < : wordSimd * wordSimd -> wordSimd;

      val << : wordSimd * wordSimd -> wordSimd;  
      val * : wordSimd * wordSimd -> wordSimd;  
      val ~ : wordSimd -> wordSimd;
      val notb : wordSimd -> wordSimd;  
      val orb : wordSimd * wordSimd -> wordSimd;

      val div : wordSimd * wordSimd -> wordSimd;  
      val mod : wordSimd * wordSimd -> wordSimd;  
      val rol : wordSimd * wordSimd -> wordSimd;  
      val ror : wordSimd * wordSimd -> wordSimd;  
      val ~>> : wordSimd * wordSimd -> wordSimd;  
      val >> : wordSimd * wordSimd -> wordSimd;  

      val - : wordSimd * wordSimd -> wordSimd;       
      val xorb : wordSimd * wordSimd -> wordSimd;

      val fromVector : word vector -> wordSimd
      val toVector : wordSimd -> word vector


   end

signature WORD_SIMD_EXTRA =
   sig
      include WORD_SIMD
      type t = wordSimd
   end
