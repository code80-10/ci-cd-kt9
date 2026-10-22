#include <iostream>

int main() {
    std::cout << "Application started successfully.\n";
#ifdef DEBUG
    std::cout << "Build mode: DEBUG\n";
#else
    std::cout << "Build mode: RELEASE\n";
#endif
    return 0;
}
