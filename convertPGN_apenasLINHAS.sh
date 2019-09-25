rm posicao
fgrep -n Annotator *.pgn > posicao

cat posicao | while read line; 
do 
	file=$(echo $line | cut -d':' -f1 );
	BASEfile=$(echo $line | cut -d':' -f1 | cut -d'.' -f1);
	inicio=$(echo $line | cut -d':' -f2);
	((inicio++))
	sed -n ''$inicio',$p' $file > $BASEfile".sem"
done

for file in $(ls *.sem)
do
	dos2unix $file
	BASEfile=$(echo $file | cut -d'.' -f1);
	sed ':a;N;$!ba;s/\n/ /g' $file | sed   's/[0-9]*\./\n/g' | sed -n '2,$p'> $BASEfile".final"
done
