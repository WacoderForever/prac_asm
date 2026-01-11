#ifndef CPP_ASM_H
#define CPP_ASM_H

#include <cstdint>

#ifdef __cplusplus
extern "C"{
#endif
    // Assembly functions called from C++
    int32_t asm_add(int32_t a,int32_t b);
    int64_t asm_multiply(int64_t a,int64_t b);
    double asm_sqrt(double a);
    void asm_str_copy(const char *src,char *dest);
    void asm_double_array_vals(int32_t *array,size_t len);
    // C++ functions to be called from assembly
    extern "C" int32_t cpp_callback(int32_t value);
    extern "C" void cpp_print_message(const char *message);
    extern "C" double cpp_math_op(double a,double b);

#ifdef __cplusplus
}
#endif

#endif  //CPP_ASM_H