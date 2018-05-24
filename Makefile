MAIN=spa
STRUCTS=linked_list_node.h linked_list.h reg_lang.h
FILES=linked_list.c lexer.c reg_lang.c parser.c

lexer: lexer.l $(STRUCTS)
	lex lexer.l

parser: lexer parser.y lexer.c $(STRUCTS)
	bison parser.y

c: parser $(MAIN).c
	gcc -o $(MAIN) $(FILES) $(MAIN).c

clean: 
	rm -rf lexer.c lexer.h parser.c parser.h $(MAIN)

all: c

redo: clean c
