#include "../inc/gamelib.h"
#include "collision.h"

void updateGameState(const Uint8 *state) {
    // todo move other relative logic here
    moveObjects(state);
    updateMissiles();
    update_coins();
    update_events();
    tasks_update();
    checkCollisions();
}
