build: genLex genSyn compilSyn
	
genLex:
	java JFlex.Main interpreter.lex

genSyn: genLex
	java java_cup.Main interpreter.cup

compilSyn: genSyn
	javac parser.java sym.java Yylex.java

testSyn: compilSyn
	java parser < sourceCode

interpreter: build
	java parser