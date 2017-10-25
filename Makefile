build: genLex genSyn compilSyn testSyn
	
genLex:
	@echo $(LEX)
	java JFlex.Main $(LEX)

genSyn: genLex
	java java_cup.Main $(SYN)

compilSyn: genSyn
	javac parser.java sym.java Yylex.java

testSyn: compilSyn
	java parser < $(INPUT)

parse: build
	java parser