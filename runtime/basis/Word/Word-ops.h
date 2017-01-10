
#define binary(kind, name, op)                                          \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  Word##kind Word##kind##_##name (Word##kind w1, Word##kind w2) {       \
    return w1 op w2;                                                    \
  }

#define bothBinary(size, name, op)              \
binary (S##size, name, op)                      \
binary (U##size, name, op)

#define compare(kind, name, op)                                         \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  Bool Word##kind##_##name (Word##kind w1, Word##kind w2) {             \
    return w1 op w2;                                                    \
  }

#define bothCompare(size, name, op)             \
compare (S##size, name, op)                     \
compare (U##size, name, op)

#define rol(size)                                                       \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  Word##size Word##size##_rol (Word##size w1, Word32 w2) {              \
    return (Word##size)(w1 >> (size - w2)) | (Word##size)(w1 << w2);    \
  }

#define ror(size)                                                       \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  Word##size Word##size##_ror (Word##size w1, Word32 w2) {              \
    return (Word##size)(w1 >> w2) | (Word##size)(w1 << (size - w2));    \
  }                                                                     \

#define shift(kind, name, op)                                           \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  Word##kind Word##kind##_##name (Word##kind w1, Word32 w2) {           \
    return (Word##kind)(w1 op w2);                                      \
  }

#define unary(kind, name, op)                                           \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  Word##kind Word##kind##_##name (Word##kind w) {                       \
    return (Word##kind)(op w);                                          \
  }

#define misaligned(size)                                                \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  Word##size##_t Word##size##_fetch (Ref(Word##size##_t) wp) {          \
    Word##size##_t w;                                                   \
    memcpy(&w, wp, sizeof(Word##size##_t));                             \
    return w;                                                           \
  }                                                                     \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  void Word##size##_store (Ref(Word##size##_t) wp, Word##size##_t w) {  \
    memcpy(wp, &w, sizeof(Word##size##_t));                             \
    return;                                                             \
  }                                                                     \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  void Word##size##_move (Ref(Word##size##_t) dst, Ref(Word##size##_t) src) { \
    memcpy(dst, src, sizeof(Word##size##_t));                           \
    return;                                                             \
  }

#define simdBinary(kind, size, name, op)                                          \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  WordSimd##kind##x##size WordSimd##kind##x##size##_##name (WordSimd##kind##x##size x1, WordSimd##kind##x##size x2) {       \
    return x1 op x2;       \
  }

#define bothSimdBinary(size, simdSize, name, op)              \
simdBinary (S##size, simdSize, name, op)                      \
simdBinary (U##size, simdSize, name, op)

#define simdUnary(kind, size, name, op)                                          \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  WordSimd##kind##x##size WordSimd##kind##x##size##_##name (WordSimd##kind##x##size x) {       \
    return op x;       \
  }


#define simdLit2(size) {size, size}

#define simdLit4(size) {size, size, size, size}

#define simdLit8(size) {size, size, size, size, size, size, size, size}

#define simdLit16(size) { \
  size, size, size, size, size, size, size, size \
, size, size, size, size, size, size, size, size \                         
}                           

#define simdRol(size, simdSize)                                                       \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  WordSimd##size##x##simdSize WordSimd##size##x##simdSize##_rol (WordSimd##size##x##simdSize x1, WordSimd##size##x##simdSize x2) {              \
    WordSimd##size##x##simdSize szSimd = simdLit##simdSize(size);                           \
    WordSimd##size##x##simdSize x3 = szSimd - x2;                            \
    return (WordSimd##size##x##simdSize)(x1 >> x3) | (WordSimd##size##x##simdSize)(x1 << x2);    \
  }

#define simdRor(size, simdSize)                                                       \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  WordSimd##size##x##simdSize WordSimd##size##x##simdSize##_ror (WordSimd##size##x##simdSize x1, WordSimd##size##x##simdSize x2) {              \
    WordSimd##size##x##simdSize szSimd = simdLit##simdSize(size);                           \
    WordSimd##size##x##simdSize x3 = szSimd - x2;                            \
    return (WordSimd##size##x##simdSize)(x1 << x3) | (WordSimd##size##x##simdSize)(x1 >> x2);    \
  }

#define simdShift(kind, size, name, op)                                           \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  WordSimd##kind##x##size WordSimd##kind##x##size##_##name (WordSimd##kind##x##size x1, WordSimd##kind##x##size x2) {           \
    return (WordSimd##kind##x##size)(x1 op x2); \
  }

#define simdFromVector(kind, size)                                          \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  WordSimd##kind##x##size WordSimd##kind##x##size##_##fromVector (Vector(Word##kind) p1) {       \
    WordSimd##kind##x##size x1;       \
    memcpy(&x1, p1, 16); \
    return x1;           \
  }

#define simdToArray(kind, size)                                          \
  MLTON_CODEGEN_STATIC_INLINE                                           \
  void WordSimd##kind##x##size##_##toArray (WordSimd##kind##x##size x1, Array(Word##kind) p1) {       \
    memcpy(p1, &x1, 16); \
  }



#define all(size)                               \
binary (size, add, +)                           \
binary (size, andb, &)                          \
compare (size, equal, ==)                       \
bothCompare (size, ge, >=)                      \
bothCompare (size, gt, >)                       \
bothCompare (size, le, <=)                      \
shift (size, lshift, <<)                        \
bothCompare (size, lt, <)                       \
bothBinary (size, mul, *)                       \
unary (size, neg, -)                            \
unary (size, notb, ~)                           \
/* WordS<N>_quot and WordS<N>_rem can't be inlined with the C-codegen,  \ 
 * because the gcc optimizer sometimes produces incorrect results       \
 * when one of the arguments is a constant.                             \
 */                                                                     \
MLTON_CODEGEN_WORDSQUOTREM_IMPL(binary (S##size, quot, /))              \
MLTON_CODEGEN_WORDSQUOTREM_IMPL(binary (S##size, rem, %))               \
binary (U##size, quot, /)                       \
binary (U##size, rem, %)                        \
binary (size, orb, |)                           \
rol(size)                                       \
ror(size)                                       \
/* WordS<N>_rshift isn't ANSI C, because ANSI doesn't guarantee sign    \
 * extension.  We use it anyway cause it always seems to work.          \
 */                                                                     \
shift (S##size, rshift, >>)                     \
shift (U##size, rshift, >>)                     \
binary (size, sub, -)                           \
binary (size, xorb, ^)                          \


#define simdAll(size, simdSize)                               \
simdBinary (size, simdSize, equal, ==)                       \
bothSimdBinary (size, simdSize, ge, >=)                      \
bothSimdBinary (size, simdSize, gt, >)                       \
bothSimdBinary (size, simdSize, le, <=)                      \
bothSimdBinary (size, simdSize, lt, <)                      \
simdBinary (size, simdSize, add, +)             \
simdBinary (size, simdSize, sub, -)             \
bothSimdBinary (size, simdSize, mul, *)             \
simdBinary (size, simdSize, xorb, ^)            \
simdBinary (size, simdSize, orb, |)             \
simdBinary (size, simdSize, andb, &)            \
simdBinary (S##size, simdSize, quot, /)              \
simdBinary (S##size, simdSize, rem, %)               \
simdBinary (U##size, simdSize, quot, /)                       \
simdBinary (U##size, simdSize, rem, %)                        \
simdUnary (size, simdSize, neg, -)              \
simdUnary (size, simdSize, notb, ~)             \
simdRol(size, simdSize)                                 \
simdRor(size, simdSize)                                 \
simdShift (S##size, simdSize, rshift, >>)                 \
simdShift (U##size, simdSize, rshift, >>)                 \
simdShift (size, simdSize, lshift, <<)                 \
simdFromVector (size, simdSize)                 \
simdToArray (size, simdSize)

all (8)
all (16)
all (32)
all (64)

simdAll (8, 16)
simdAll (16, 8)
simdAll (32, 4)
simdAll (64, 2)

misaligned(64)

#undef all
#undef simdAll
#undef misaligned
#undef unary
#undef shift
#undef ror
#undef rol
#undef bothCompare
#undef compare
#undef bothBinary
#undef binary
#undef simdBinary 
#undef simdRol
#undef simdRor
#undef simdShit
#undef simdUnary 
#undef simdFromVector
#undef simdToArray
