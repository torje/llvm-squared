import fio = std.file, std.stdio, std.string, std.exception, std.algorithm, std.conv;
int main(string[] args){
	enforce(args.length> 1);
	string content = fio.readText(args[1]);
	string[] lines = content.splitLines();
	writeln(lines.length);
	string[string] functions;
	string[] program = eatPreamble(lines);

	string[string][][] tokenized;

	while( program.length > 0){
		writeln( program.length);
		tokenize( program, tokenized);
	}

	return 0;
}

string[] eatPreamble(string[] program){
	return program[4..$];
}

void tokenize(ref string[] program, string[string][][] tokenized){

	string[] tmp;
	tmp = program[0].split(" ");
	program=program[1..$];
	if ( tmp.length ==0){
		return;
	}
	if(tmp[0] == "define"){
		writeln("case 1");
		string proto = join(tmp[1..$] , " ");
		return parseFunction(proto, program, tokenized);
	}
	if (tmp[0] =="declare"){
		writeln("case 2");
		string proto = join(tmp[1..$] , " ");
		return parseExternal(proto, program, tokenized);
	}
	else if ( tmp[0] == ";" && tmp[1] == "<label>" ){
		writeln("case 3");
		size_t label = to!size_t(tmp[2]);
		return parseLabel( label, program, tokenized);
	}
	else 
		throw new Exception("");
}
void parseFunction(string proto , ref string[] program , string[string][][] tokenized){
	while ( program[0].split(" ")[0] != "}" ){
		writeln("heisann");
		program = program[1..$];
	}
		program = program[1..$];
	return;
}
void parseExternal(string proto , string[] program , string[string][][] tokenized){
	return;
}
void parseLabel(size_t label, string[] program, string[string][][] tokenized){
	return;
}
