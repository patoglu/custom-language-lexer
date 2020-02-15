/*Sources : https://www.youtube.com/watch?v=54bo1qaHAfk&t=1617s*/
			

#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

int main(void)
{
	printf("$ g++ ");
	int ntoken, vtoken = VTOKEN;
	int state_1 = 0;
	int currentNumber = 0;
	do
	{	
		currentNumber++;
		vtoken = ntoken;
		ntoken = yylex();
		if(ntoken != OP_OP && currentNumber == 1)
		{
			printf("syntax error in line %d, Expected '(' but found %s\n",yylineno, yytext);
			break;
		}
		switch(ntoken)
		{
			case KW_AND:
				printf("TOKEN: [ %s ] -> KW_AND\n", yytext);
				break;
			case KW_OR:
				printf("TOKEN: [ %s ] -> KW_OR\n", yytext);
				break;
			case KW_NOT: 
				printf("TOKEN: [ %s ] -> KW_NOT\n", yytext);
				break;
			case KW_EQUAL: 
				printf("TOKEN: [ %s ] -> KW_EQUAL\n", yytext);
				break;
			case KW_LESS:
				printf("TOKEN: [ %s ] -> KW_LESS\n", yytext);
				break; 
			case KW_NIL: 
				printf("TOKEN: [ %s ] -> KW_NIL\n", yytext);
				break;
			case KW_LIST: 
				printf("TOKEN: [ %s ] -> KW_LIST\n", yytext);
				break;
			case KW_APPEND: 
				printf("TOKEN: [ %s ] -> KW_APPEND\n", yytext);
				break;
			case KW_CONCAT:
				printf("TOKEN: [ %s ] -> KW_CONCAT\n", yytext);
				break;
			case KW_SET: 
				printf("TOKEN: [ %s ] -> KW_SET\n", yytext);
				break;
			case KW_DEFFUN: 
				printf("TOKEN: [ %s ] -> KW_DEFFUN\n", yytext);
				break;
			case KW_FOR: 
				printf("TOKEN: [ %s ] -> KW_FOR\n", yytext);
				break;
			case KW_IF: 
				printf("TOKEN: [ %s ] -> KW_IF\n", yytext);
				break;
			case KW_EXIT: 
				printf("TOKEN: [ %s ] -> KW_EXIT\n", yytext);
				break;
			case KW_LOAD: 
				printf("TOKEN: [ %s ] -> KW_LOAD\n", yytext);
				break;
			case KW_DISP: 
				printf("TOKEN: [ %s ] -> KW_DISP\n", yytext);
				break;
			case KW_TRUE: 
				printf("TOKEN: [ %s ] -> KW_TRUE\n", yytext);
				break;
			case KW_FALSE: 
				printf("TOKEN: [ %s ] -> KW_FALSE\n", yytext);
				break;
		    case OP_PLUS:
		    	printf("TOKEN: [ %s ] -> OP_PLUS\n", yytext);
				break;
		 	case OP_MINUS: 
		 		printf("TOKEN: [ %s ] -> OP_MINUS\n", yytext);
				break;
		 	case OP_DIV: 
		 		printf("TOKEN: [ %s ] -> OP_DIV\n", yytext);
				break;
			case OP_MULT: 
				printf("TOKEN: [ %s ] -> OP_MULT\n", yytext);
				break;
		 	case OP_OP:
		 		printf("TOKEN: [ %s ] -> OP_OP\n", yytext);
				break;
		 	case OP_CP: 
		 		printf("TOKEN: [ %s ] -> OP_CP\n", yytext);
				break;
		 	case OP_DBLMULT: 
		 		printf("TOKEN: [ %s ] -> OP_DBLMULT\n", yytext);
				break;
		 	case OP_OC:
		 		printf("TOKEN: [ %s ] -> OP_OC\n", yytext);
				break;
		 	case OP_CC:
		 		printf("TOKEN: [ %s ] -> OP_CC\n", yytext);
				break;
		 	case OP_COMMA: 
		 		printf("TOKEN: [ %s ] -> OP_COMMA	\n", yytext);
				break;
			case IDENTIFIER: 
				if(vtoken == VALUE)
				{
					printf("syntax error in line %d, identifier starts with digit. %s\n",yylineno, yytext);
				}
				printf("TOKEN: [ %s ] -> IDENTIFIER\n", yytext);
				break;
			case VALUE:
				printf("TOKEN: [ %s ] -> VALUE\n", yytext);
				break;
			case COMMENT:
				printf("TOKEN: [ %s ] -> COMMENT\n", yytext);
				break;
		

			case SPACE:
				break;
		 	default: 
		 		printf("syntax error in line %d, unknown symbol %s\n",yylineno, yytext);
 
		}
	
	}while(ntoken);
	return 0;
}
