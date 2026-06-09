#include "engine.h"
#include "game.h"

int main(void) {
    if (renderStartScreen()) {
        gameLoop();
    }
    cleanup();
    return 0;
}
