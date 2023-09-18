#include "hytech_hal/hytech_hal.h"

void update_screen(int number)
{
    uint8_t asdf = encode(number);
    spi_send(asdf);
}