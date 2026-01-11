#include <iostream>
#include <cmath>
#include <cstring>

#include "cpp_asm_header.h"

// C++ functions Assembly will call
extern "C" void cpp_print_message(const char *message){
    std::cout<<"Message from assembly:"<<message<<"\n";
}

extern "C" double cpp_math_op(double a,double b){
    return std::sin(a)*std::cos(b);
}

extern "C" int32_t cpp_callback(int32_t value){
    std::cout << "C++ callback received: " << value << std::endl;
    return value*2;
}

int main(){
    //Calling assembly functions from C++
    std::cout<<"Calling assembly functions from C++"<<"\n";

    int32_t sum=asm_add(10,20);
    std::cout<<"asm_add(10,20): "<<sum<<"\n";

    int64_t product=asm_multiply(5,7);
    std::cout<<"asm_multiply(5,7): "<<product<<"\n";

    double sqrt = asm_sqrt(25.0);
    std::cout<<"asm_sqrt(25.0): "<<sqrt<<std::endl;

    char buffer[50];
    const char *message = "Hello from C++";
    asm_str_copy(message,buffer);
    std::cout<<"Copied message:"<<message<<std::endl;

    int32_t arr[5] = {1,2,3,4,5};
    asm_double_array_vals(arr,5);
    std::cout<<"Array after processing:"<<std::endl;
    for(int i=0;i<5;i++){
        std::cout<<arr[i]<<" ";
    }
    std::cout<<std::endl;

    return 0;
}