int placementA[5] = {2,0,1,3,4};
bool done = false, done1 = false, done2 = false, done3 = false, done4 = false;
proctype printArray()
{
	int i = 0;
	for(i in placementA){
		if
		:: i == 0 -> printf("EMPTY %u,\n", placementA[i]);
		:: else -> printf("FROG%u@%u,\n",i, placementA[i]);
		fi
	}
}

active proctype FROG1() {
	if
	:: !done1 ->
		do 
		:: if
			:: ((placementA[0] - placementA[1] < 3) && (placementA[0] - placementA[1] > 0)) ->
				atomic{
				int temp = placementA[0];
				placementA[0] = placementA[1];
				placementA[1] = temp;
				printf("FROG1 FROM %u TO %u \n",placementA[0],placementA[1]);
				if
				:: placementA[1] > 2 ->
					done1 = true;
					if
					:: done1 && done2 && done3 && done4 -> 
						done = true;
						do
						::	assert(!done);
						od
					fi
				fi
				}
		   fi
		od	
	fi
}

active proctype FROG2() {
	if
	:: !done2 ->
		do 
		:: if
			:: (placementA[0] - placementA[2] < 3) && (placementA[0] - placementA[2] > 0) ->
			atomic{					int temp = placementA[0];
			placementA[0] = placementA[2];
			placementA[2] = temp;
			printf("FROG2 FROM %u TO %u \n",placementA[0],placementA[2]);
			if
			:: placementA[2] > 2 ->	
				done2 = true;
				if
				:: done1 && done2 && done3 && done4 -> 
					done = true;
					do
					::	assert(!done);
					od
				fi
			fi
			}
		fi
		od
	fi
}

active proctype FROG3() {
	if
	:: !done3 ->	
		do 
		:: if
			:: (placementA[3] - placementA[0] < 3) && (placementA[3] - placementA[0] > 0) ->
			atomic{
			int temp = placementA[0];
			placementA[0] = placementA[3];
			placementA[3] = temp;
			printf("FROG3 FROM %u TO %u \n",placementA[0],placementA[3]);
			if
			:: placementA[3] < 2 ->
				done3 = true;						
				if
				:: done1 && done2 && done3 && done4 -> 
					done = true;
					do
					::	assert(!done);
					od
				fi
			fi
			}
		fi
		od
	fi
}

active proctype FROG4() {
	if
	:: !done4 ->
		do 
		:: if
			:: (placementA[4] - placementA[0] < 3) && (placementA[4] - placementA[0] > 0) ->
			atomic{
			int temp = placementA[0];
			placementA[0] = placementA[4];
			placementA[4] = temp;
			printf("FROG4 FROM %u TO %u \n",placementA[0],placementA[4]);
			if
			:: placementA[4] < 2 ->
				done4 = true;
				if
				:: done1 && done2 && done3 && done4 -> 
					done = true;
					do
					::	assert(!done);
					od
				fi
			fi
			}
		fi
		od
	fi
}

init{run printArray();run FROG1();run FROG2();run FROG3();run FROG4();}
