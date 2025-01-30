#include <bits/stdc++.h>
using namespace std;
int c=0,n=0,p=0;
void clasificar(string a){
	int dig=0, car=0;

	for(int x:a){
		if(x==' '){
		  if(dig>0 && car>0)  c++;
     	  if(dig>0 && car==0) n++;
    	  if(dig==0 && car>0) p++;
    	  
    	  dig=0; car=0;
    	  
		}else if(isdigit(x)){
			dig++;
		}else{
			car++;
		}
	}
	      if(dig>0 && car>0)  c++;
     	  if(dig>0 && car==0) n++;
    	  if(dig==0 && car>0) p++;
	
	
	
}

int main(){
	
	string a;
	getline(cin, a); 
	
	clasificar(a);

	if(c!=0) cout<<c<<" - Compuesta  ";
	if(n!=0) cout<<n<<" - Entero  ";	
	if(p!=0) cout<<p<<" - Palabra  ";		
		
}
