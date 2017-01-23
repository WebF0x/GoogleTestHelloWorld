#include <cassert>

#include "gtest/gtest.h"
#include "functions.hpp"

void test_factorial()
{
    assert(factorial(0) == 1);
    assert(factorial(1) == 1);
    assert(factorial(2) == 2);
    assert(factorial(3) == 6);
    assert(factorial(4) == 24);
    assert(factorial(5) == 120);
}

void test_google_test()
{
    EXPECT_EQ(1, 1);
}

int main()
{
    test_factorial();
    test_google_test();

    return 0;
}

