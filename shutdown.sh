vboxmanage list runningvms > /tmp/file.txt
if [ -s /tmp/file.txt ]
then
	vboxmanage list runningvms |awk '{print $1}' > runningvms.txt
    for i in $(cat runningvms.txt)
	do
        temp="${i%\"}"
		temp="${temp#\"}"
		vboxmanage controlvm $i poweroff soft
    done
else
	sudo shutdown 10
fi