##
## Makefile for LemiPC in /home/jibb/rendu/PSU_2014_lemipc
##
## Made by Jean-Baptiste Grégoire
## Login   <jibb@epitech.net>
##
## Started on  Fri Feb 27 11:27:47 2015 Jean-Baptiste Grégoire
## Last update Wed Mar  4 01:01:46 2015 David Tran
##

DEBUG		= 	yes

NAME		=	lemipc

GRAPHIC		=	graphic_lemipc

SRC		=	src/main.c		\
			src/control_map.c	\
			src/create_ia.c		\
			src/destroy.c

SRC_GRAPH	=	src_graphic/graphic_main.c

OBJ		=	$(SRC:.c=.o)

OBJ_GRAPH	=	$(SRC_GRAPH:.c=.o)

RM		=	rm -f

CC		=	gcc

INCLUDES	=	includes/

FOLDER_SRC	=	src/

CFLAGS		=	-W -Wall -Wextra -I $(INCLUDES)

ifeq ($(DEBUG),yes)
	CFLAGS 	+= -g3
else
	CFLAGS	+= -O3
endif

$(NAME):	$(OBJ)
		$(CC) -o $(NAME) $(OBJ) -pthread

$(GRAPHIC):	$(OBJ_GRAPH)
		$(CC) $(CFLAGS) -o $(GRAPHIC) $(OBJ_GRAPH) -lSDL -lSDLmain -lSDL_gfx -lSDL_image

graphic:	$(GRAPHIC)

all:		$(NAME)

clean:
		$(RM) $(OBJ)
		$(RM) $(OBJ_GRAPH)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHNOY:		re fclean clean all
