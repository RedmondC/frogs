int placementA[5];
int i;

placementA[0] = 2;
placementA[1] = 0;
placementA[2] = 1;
placementA[3] = 3;
placementA[4] = 4;

proctype printArray()
{
	for(i : 0 .. placementA.length){
		if
		:: placementA[i] == 0 -> 
			printf("EMPTY " + placementA[i] + ", ")
		:: else ->
			printf("FROG" + i + "@" + placementA[i] + ", ")
		fi
	}
}

active proctype FROG1() {
	do 
	:: if
		:: placementA[0] - placementA[1] < 3 ->
			atomic{
			int temp = placementA[0];
			placementA[0] = placementA[1];
			placementA[1] = temp;
			printf("FROG1 FROM " + placementA[0] + " TO " + placementA[1]);
			run printArray();
			}
		else 
		fi
	od
}

active proctype FROG2() {
	do 
	:: if
		:: placementA[0] - placementA[2] < 3 ->
			atomic{
			int temp = placementA[0];
			placementA[0] = placementA[2];
			placementA[2] = temp;
			printf("FROG2 FROM " + placementA[0] + " TO " + placementA[2]);
			run printArray();
			}
		else 
		fi
	od
}

active proctype FROG3() {
	do 
	:: if
		:: placementA[3] - placementA[0] < 3 ->
			atomic{
			int temp = placementA[0];
			placementA[0] = placementA[3];
			placementA[3] = temp;
			printf("FROG3 FROM " + placementA[0] + " TO " + placementA[3]);
			run printArray();
			}
		else 
		fi
	od
}

active proctype FROG4() {
	do 
	:: if
		:: placementA[4] - placementA[0] < 3 ->
			atomic{
			int temp = placementA[0];
			placementA[0] = placementA[4];
			placementA[4] = temp;
			printf("FROG4 FROM " + placementA[0] + " TO " + placementA[4]);
			run printArray();
			}
		else 
		fi
	od
}
