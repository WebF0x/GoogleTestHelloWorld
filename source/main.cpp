#include <iostream>

#include "functions.hpp"

int main()
{
    print_hello();
    std::cout << std::endl;
    std::cout << "The factorial of 5 is " << factorial(5) << std::endl;
    return 0;
}
