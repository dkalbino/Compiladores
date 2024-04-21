%{
#include <iostream>
#include <string>
#include <sstream>
#include <string.h>

#define YYSTYPE atributos

using namespace std;

int var_temp_qnt;

struct atributos
{
	string label;
	string traducao;
	string tipo;
};

string tipos[4][50] = {"0"};
string tipos_int[50] = {"0"};
string tipos_float[50] = {"0"};
string tipos_char[50] = {"0"};
string tipos_bool[50] = {"0"};
int pos_i = 0;
int pos_f = 0;
int pos_b = 0;
int pos_c = 0;
int yylex(void);
void yyerror(string);
string gentempcode();
string print();
%}

%token TK_NUM
%token TK_MAIN TK_ID TK_TIPO_INT
%token TK_FIM TK_ERROR TK_ELOG TK_EQUAL TK_DIFERENT TK_MAIOR_IGUAL TK_MENOR_IGUAL TK_ASPA

%start S

%left '+'

%%

S 			: TK_TIPO_INT TK_MAIN '(' ')' BLOCO
			{
				string codigo = "/*Compilador FOCA*/\n"
								"#include <iostream>\n"
								"#include<string.h>\n"
								"#include<stdio.h>\n"
								"DEFINE bool int;\n"
								"DEFINE true 1;\n"
								"DEFINE false 0;\n"
								"int main(void) {\n";
					
				codigo += print();

				codigo += $5.traducao;
								
				codigo += 	"\treturn 0;"
							"\n}";

				cout << codigo << endl;
			}
			;

BLOCO		: '{' COMANDOS '}'
			{
				$$.traducao = $2.traducao;
			}
			;

COMANDOS	: COMANDO COMANDOS
			{
				$$.traducao = $1.traducao + $2.traducao;
			}
			|
			{
				$$.traducao = "";
			}
			;

COMANDO 	: E ';'
			{
				$$ = $1;
			}
			;

E 			: E '+' E
			{
				$$.label = gentempcode();
				if($1.tipo.compare("float") == 0 || $3.tipo.compare("float") == 0)
				{
					$$.tipo = "float";
					tipos_float[pos_f] = $$.label;
					pos_f++;
				}else{
					$$.tipo = "int";
					tipos_int[pos_i] = $$.label;
					pos_i++;
				}
				$$.traducao = $1.traducao + $3.traducao + "\t" + $$.label + 
					" = " + $1.label + " + " + $3.label + ";\n";
			}
			| E '-' E
			{
				$$.label = gentempcode();
				$$.tipo = "int";
				tipos_int[pos_i] = $$.label;
				pos_i++;
				$$.traducao = $1.traducao + $3.traducao + "\t" + $$.label + 
					" = " + $1.label + " - " + $3.label + ";\n";
			}
			| E TK_ELOG E
			{
				$$.label = gentempcode();
				$$.tipo = "bool";
				tipos_bool[pos_b] = $$.label;
				pos_b++;
				$$.traducao = $1.traducao + $3.traducao;
				$$.traducao += "\t" + $$.label + " = " + $1.label + " && " + $3.label + ";\n";
			}
			| E TK_EQUAL E
			{
				$$.label = gentempcode();
				$$.tipo = "bool";
				tipos_bool[pos_b] = $$.label;
				pos_b++;
				$$.traducao = $1.traducao + $3.traducao;
				$$.traducao += "\t" + $$.label + " = " + $1.label + " == " + $3.label + ";\n";
			}
			| E TK_MENOR_IGUAL E
			{
				$$.label = gentempcode();
				$$.tipo = "bool";
				tipos_bool[pos_b] = $$.label;
				pos_b++;
				$$.traducao = $1.traducao + $3.traducao;
				$$.traducao += "\t" + $$.label + " = " + $1.label + " <= " + $3.label + ";\n";
			}
			| E TK_MAIOR_IGUAL E
			{
				$$.label = gentempcode();
				$$.tipo = "bool";
				tipos_bool[pos_b] = $$.label;
				pos_b++;
				$$.traducao = $1.traducao + $3.traducao;
				$$.traducao += "\t" + $$.label + " = " + $1.label + " >= " + $3.label + ";\n";
			}
			| E TK_DIFERENT E
			{
				$$.label = gentempcode();
				$$.tipo = "bool";
				tipos_bool[pos_b] = $$.label;
				pos_b += 1;
				$$.traducao = $1.traducao + $3.traducao;
				$$.traducao += "\t" + $$.label + " = " + $1.label + " != " + $3.label + ";\n";
			}
			| TK_ID '=' E
			{
				$$.tipo = $3.tipo;

				if($3.tipo.compare("int") == 0)
				{
					tipos_int[pos_i] = $1.label;
					pos_i++;
				}
				
				if($3.tipo.compare("float") == 0)
				{
					tipos_float[pos_f] = $1.label;
					pos_f++;
				}

				if($3.tipo.compare("bool") == 0)
				{
					tipos_bool[pos_b] = $1.label;
					pos_b++;
				}

				if($3.tipo.compare("char") == 0)
				{
					tipos_char[pos_c] = $1.label;
					pos_c++;
				}

				$$.traducao = $1.traducao + $3.traducao + "\t" + $1.label + " = " + $3.label + ";\n";
			}
			| TK_ASPA TK_ID TK_ASPA
			{
				$$.label = gentempcode();
				$$.tipo = "char";
				tipos_char[pos_c] = $$.label;
				pos_c++;
				$$.traducao = "\t" + $$.label + " = " + "'" + $2.label + "'" + ";\n";
			}
			| TK_NUM
			{
				$$.label = gentempcode();
				$$.tipo = "int";
				tipos_int[pos_i] = $$.label;
				pos_i++;
				$$.traducao = "\t" + $$.label + " = " + $1.label + ";\n";
			}
			|TK_NUM '.' TK_NUM
			{
				$$.label = gentempcode();
				$$.tipo = "float";
				tipos_float[pos_f] = $$.label;
				pos_f++;
				$$.traducao = "\t" + $$.label + " = " + $1.label + "." + $3.label + ";\n";
			}
			| TK_ID
			{
				$$.label = gentempcode();
				$$.tipo = $1.tipo;
				$$.traducao = "\t" + $$.label + " = " + $1.label + ";\n";
			}
			;

%%

#include "lex.yy.c"

int yyparse();

string gentempcode()
{
	var_temp_qnt++;
	return "t" + to_string(var_temp_qnt);
}

int main(int argc, char* argv[])
{
	var_temp_qnt = 0;

	yyparse();

	return 0;
}

string print()
{
	string codigo;
	for(int i = 0; i<4;i++)
	{
		if(i == 0 && tipos_int[0] != "0")
		{ 
			codigo +=  "\tint";
			for(int j = 0; j<pos_i ; j++)
			{
				if(j == pos_i - 1)
				{
					codigo +=  " " + tipos_int[j] + ";\n";
				}else{
					codigo +=  " " + tipos_int[j] + ",";
				}
			}
		}else if(i == 1 && tipos_float[0] != "0")
		{ 
			codigo +=  "\tfloat";
			for(int j = 0; j<pos_f ; j++)
			{
				if(j == pos_f - 1)
				{
					codigo +=  " " + tipos_float[j] + ";\n";
				}else{
					codigo +=  " " + tipos_float[j] + ",";
				}
			}
		}else if(i == 2 && tipos_bool[0] != "0")
		{ 
			codigo +=  "\tbool";
			for(int j = 0; j<pos_b ; j++)
			{
				if(j == pos_b - 1)
				{
					codigo +=  " " + tipos_bool[j] + ";\n";
				}else{
					codigo +=  " " + tipos_bool[j] + ",";
				}
			}
		}else if(i == 3 && tipos_char[0] != "0")
		{ 
			codigo +=  "\tchar";
			for(int j = 0; j<pos_c ; j++)
			{
				if(j == pos_c - 1)
				{
					codigo +=  " " + tipos_char[j] + ";\n";
				}else{
					codigo +=  " " + tipos_char[j] + ",";
				}
			}
		}
	}
	return codigo;
}

void yyerror(string MSG)
{
	cout << MSG << endl;
	exit (0);
}			