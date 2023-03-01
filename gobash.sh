#!/bin/bash
#rangapv@yahoo.com 27-02-2023


gocheck () {

goc1=`which go`
goc1s="$?"
goc2=`go version`
goc2s="$?"
if [[ ($goc1s -eq 0) && ($goc2s -eq 0) ]]
then
	echo "Current `(go version)` in this system"
else
	`source <(curl -s https://raw.githubusercontent.com/rangapv/goi/master/goi.sh)`
fi

}


makfile () {

imp="$@"
`echo "package main" >> $HOME/$mod1/$mod1.go`
`echo "import ("  >> $HOME/$mod1/$mod1.go`

impfunc $imp 

#`echo "\"$imp\"" >> $HOME/$mod1/$mod1.go`
`echo ")" >> $HOME/$mod1/$mod1.go`
`funcmain >> $HOME/$mod1/$mod1.go`

}

impfunc () {

arg="$#"
arg1="$@"
i=0
for i in "$@"
do
	`echo "   \"$i\"" >> $HOME/$mod1/$mod1.go`
done

}


funcmain () {

echo "func main() {"
echo " fmt.Println(\"Hello, World!\")"
echo "}"

}

gocheck

echo " THis is a go skeletal program generator"
echo " Enter the Module name (a.k.a example/hello)"
read mod
mod1=`(echo "$mod" | awk '{ split($0,a,"/") ; print a[2] }')`
d1=`mkdir $HOME/$mod1`
cd1=`cd $HOME/$mod1;go mod init $mod;touch "$mod1.go"`


makfile fmt
