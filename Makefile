NAME	= fractol
CFLAGS  = -Wextra -Wall -Werror -Wno-unused-result -Ofast
LIBMLX	= minilibx
LIBS	= $(LIBMLX)/libmlx.a -lX11 -lXext -lm
HEADERS	= -I ./include -I $(LIBMLX)
CC = cc
MAKE = make

SRCS = bonus/fractol_bonus bonus/fractol_event_bonus bonus/fractol_init_bonus bonus/fractol_render_bonus bonus/fractol_suite_bonus

INC_FILES = fractol_bonus.h

SRC = $(addsuffix .c,$(SRCS))
OBJS = $(addsuffix .o,$(SRCS))

all: $(NAME)

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@ $(HEADERS)  && printf "Compiling: $(notdir $<)"

$(NAME): $(OBJS) $(LIBS)
	@$(CC) $(OBJS) $(LIBS) $(HEADERS) $(CFLAGS) -o $(NAME)

$(LIBS):
	@$(MAKE) -C $(LIBMLX)


clean:
	@rm -rf $(OBJS)
	@$(MAKE) -C $(LIBMLX) clean

fclean: clean
	@rm -rf $(NAME)

re: clean all

.PHONY: all, clean, fclean, re, libmlx
