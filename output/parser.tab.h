/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_OUTPUT_PARSER_TAB_H_INCLUDED
# define YY_YY_OUTPUT_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TK_NUM = 258,                  /* TK_NUM  */
    EOL = 259,                     /* EOL  */
    TK_MINUS_MINUS = 260,          /* TK_MINUS_MINUS  */
    TK_MAIN = 261,                 /* TK_MAIN  */
    TK_ID = 262,                   /* TK_ID  */
    TK_TIPO_INT = 263,             /* TK_TIPO_INT  */
    TK_FIM = 264,                  /* TK_FIM  */
    TK_ERROR = 265,                /* TK_ERROR  */
    TK_ELOG = 266,                 /* TK_ELOG  */
    TK_EQUAL = 267,                /* TK_EQUAL  */
    TK_DIFERENT = 268,             /* TK_DIFERENT  */
    TK_MAIOR_IGUAL = 269,          /* TK_MAIOR_IGUAL  */
    TK_MENOR_IGUAL = 270,          /* TK_MENOR_IGUAL  */
    TK_ASPA = 271,                 /* TK_ASPA  */
    TK_NEGATIVE = 272,             /* TK_NEGATIVE  */
    TK_OR = 273                    /* TK_OR  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define TK_NUM 258
#define EOL 259
#define TK_MINUS_MINUS 260
#define TK_MAIN 261
#define TK_ID 262
#define TK_TIPO_INT 263
#define TK_FIM 264
#define TK_ERROR 265
#define TK_ELOG 266
#define TK_EQUAL 267
#define TK_DIFERENT 268
#define TK_MAIOR_IGUAL 269
#define TK_MENOR_IGUAL 270
#define TK_ASPA 271
#define TK_NEGATIVE 272
#define TK_OR 273

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_OUTPUT_PARSER_TAB_H_INCLUDED  */