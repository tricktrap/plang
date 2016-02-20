plang:	scanner.l parser.y
				bison -d parser.y
				flex scanner.l
				cc -o $@ parser.tab.c lex.yy.c -lfl

clean:
				rm parser.tab.*
				rm lex.yy.c
				rm plang
