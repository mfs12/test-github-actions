CROSS_COMPILE:=arm-none-eabi-

CC=$(CROSS_COMPILE)gcc

CFLAGS=
LDFLAGS=\
	-std=gnu2x \
	-static --specs=nano.specs -Wl,--gc-sections -Wl,--fatal-warnings \
	-Wl,--defsym,__stack_size__=0x1000 -T./flash.ld \
	-O2 -g -DNDEBUG -DARM_MATH_CM4=true -D__SAM4S4B__\
	-mcpu=cortex-m4 -mthumb -mlong-calls \
	-ffunction-sections -fdata-sections -fno-exceptions \
	-fsingle-precision-constant \
	-Wall -Wextra -Wundef -Wdouble-promotion -Wno-expansion-to-defined


SRCS=main.c

main: $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $?

all: main

clean:
	rm -f main

.PHONY: all clean
