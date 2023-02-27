#!/bin/bash
#rangapv@yahoo.com 27-02-2023

makfile () {

imp="$1"

`echo "package main" >> $HOME/$mod1/$mod1.go`
`echo "import \"$imp\"" >> $HOME/$mod1/$mod1.go`
`funcmain >> $HOME/$mod1/$mod1.go`

}

funcmain () {

echo "func main() {"
echo " fmt.Println(\"Hello, World!\")"
echo "}"

}

echo " THis is a go skeletal program generator"
echo " Enter the Module name (a.k.a example/hello)"
read mod
mod1=`(echo "$mod" | awk '{ split($0,a,"/") ; print a[2] }')`
echo "mod1 is $mod1"
d1=`mkdir $HOME/$mod1`
cd1=`cd $HOME/$mod1;go mod init $mod;touch "$mod1.go"`


makfile fmt
