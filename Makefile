build: genLex genSyn compilSyn
	
genLex:
	java JFlex.Main interpreter.lex

genSyn: genLex
	java java_cup.Main interpreter.cup

compilSyn: genSyn
	javac parser.java sym.java Yylex.java

test1: compilSyn
	java parser < sourceCode

test2: compilSyn
	java parser < wrongCode

interpreter: build
	java parser
clean:
	rm 'CUP$parser$actions.class'
	rm *.class
	rm *.java
	rm *.~
