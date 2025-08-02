#include <emscripten.h>
#include <stdio.h>

EMSCRIPTEN_KEEPALIVE
int add(int a, int b) {
    return a + b;
}

EMSCRIPTEN_KEEPALIVE
int multiply(int a, int b) {
    return a * b;
}

EMSCRIPTEN_KEEPALIVE
void hello_world() {
    printf("Hello from WebAssembly!\n");
}

EMSCRIPTEN_KEEPALIVE
double calculate_pi_approximation(int iterations) {
    double pi = 0.0;
    for (int i = 0; i < iterations; i++) {
        pi += (i % 2 == 0 ? 1.0 : -1.0) / (2 * i + 1);
    }
    return pi * 4;
}

int main() {
    printf("WASM module loaded successfully\n");
    return 0;
}