#!/bin/awk -f

BEGIN {
    current="";
    FS="#";
    pattern="Sink";
    stage=0;
    dbg=0;
    sink=-1;
    name="";
    nice_name="";
}

{
    if(stage==0) {          # looking for Sink number
        if ($1~/^Sink\s*$/) {
            if(dbg) print "stage: " stage " val: " $2;
            sink=$2;
            FS=":";
            stage=1;
        }
    } else if(stage==1) {
        if($1~/Name/) {
            name=$2;
            if(dbg) print "stage: " stage " val: " $2;
            FS="=";
            stage=2;
        }
    } else if(stage==2) {
        if($1~/alsa.card_name/) {
            nice_name=$2;
            if(dbg) print "stage: " stage " val: " $2;
            print sink nice_name  # name
            FS="#";
            stage=0;
            sink=-1;
            name="";
            nice_name="";
        }
    }
}

