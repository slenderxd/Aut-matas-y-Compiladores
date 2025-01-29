#include <bits/stdc++.h>
#include <ctype.h>
using namespace std;

string clasificar(string a){
	int dig=0, car=0;
	
	for(int x:a){
		if(isdigit(x)){
			dig++;
		}else{
			car++;
		}
	}
	
	if(dig>0 && car>0) 	return "Compuesta";
	if(dig>0 && car==0) return "Numero entero";
	if(dig==0 && car>0) return "Palabra";	
	
}

int main(){
	string a;
	cin>>a;
	cout<<clasificar(a);	
}
