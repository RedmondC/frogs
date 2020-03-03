int placementA[5] = {2,0,1,3,4};

proctype printArray()
{
	int i;
	for(i : 0 .. 5){
		if
		:: placementA[i] == 0 -> printf("EMPTY %u,", placementA[i]);
		:: else -> printf("FROG%u@%u,",i, placementA[i]);
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
			printf("FROG1 FROM %u TO %u",placementA[0],placementA[1]);
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
			printf("FROG1 FROM %u TO %u",placementA[0],placementA[2]);
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
			printf("FROG1 FROM %u TO %u",placementA[0],placementA[3]);
			run printArray();
			}
		else 
		fi
	od
}

active proctype FROG4() {
	if
	:: placementA[4] == 1 || placementA[4] == 0 ->
		do 
		:: if
			:: placementA[4] - placementA[0] < 3 ->
				atomic{
				int temp = placementA[0];
				placementA[0] = placementA[4];
				placementA[4] = temp;
				printf("FROG1 FROM %u TO %u",placementA[0],placementA[4]);
				run printArray();
				}
			else 
			fi
		od
	fi
}

init{run FROG1();run FROG2();run FROG3();run FROG4();}
