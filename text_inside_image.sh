#!/bin/bash



f_error() {
	echo
	echo -e "\e[1;31m 		*Invalid Option*"
	echo
	echo
	sleep 2
	f_main
}


f_instalar(){
	echo -e "\e[1;32mThe tool is being installed\e[0m"
	echo -e "\e[1;31m" 
	apt-get install steghide
	echo -e "\e[0m"
	sleep 2
	echo -e "\e[1;32m=====The tool has been installed successfully=====\e[0m"
	sleep 5
	f_main
}
f_instrucciones(){
	echo -e "\e[1;36m"
	echo -e "both the image and the .txt have to be on desktop."
	echo -e "When you insert the text, you will be asked to enter a password"
	echo -e "remember then to be able to get the message out of the image"
	echo -e "\e[0m"
	sleep 15
}
f_mensaje(){
	echo -e "\e[1;32mWrite a message and save it as message.txt"
	sleep 2	
	echo -e "Wait while the editor opens\e[0m"
	sleep 1
	gedit
	f_main
	
}
f_salir(){
	echo
	echo -e "\e[1;36mGood bye!\e[0m"
	exit

}
f_banner(){
echo -e "\e[1;32m               °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°\e[0m"
echo -e "\e[1;32m             °°°°°°\e[0m\e[1;31m            Hide The In An Image V2.1           \e[0m\e[1;32m°°°°°°°\e[0m"
echo -e "\e[1;32m               °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°\e[0m\e[1;37mby Luis Scozzese\e[0m\e[1;32m°°°°\e[0m"
echo             
}
f_insertar(){
	echo "Before executing it, you have to make sure that the message is renamed as message.txt and the image as image.jpg"
	echo
	echo -e "\e[1;32m[01] YES\e[0m"
	echo
	echo -e "\e[1;31m[02] NO\e[0m"
	echo
	read RESPUESTA

	case $RESPUESTA in
		1)
			steghide embed -cf image.jpg -ef message.txt
			;;
		2)
			f_main
			;;
		*)
			f_error
			;;

	esac
}
f_descifrar(){
	echo "Rename the image as image.jpg"
	echo
	echo -e "\e[1;32m[01] YES\e[0m"
	echo
	echo -e "\e[1;31m[02] NO\e[0m"
	echo
	read LOHICE

	case $LOHICE in
		1)
			steghide extract -sf image.jpg
			;;
		2)
			f_main
			;;
		*)
			f_error
			;;
	esac

}
f_main(){
clear
f_banner
echo
echo -e "\e[1;36m What option do you want to execute?\e[0m"
echo

echo -e "\e[1;37m[01] Install the tool"
echo 
echo -e "[02] Create message"
echo
echo -e "[03] Insert message"
echo
echo -e "[04] Extract the message"
echo
echo -e "[05] Help"
echo
echo -e "[06] Exit\e[0m"
echo
read OPCION

case $OPCION in
	1)
		f_instalar
		;;
	2)
		f_mensaje
		;;
	3)
		f_insertar
		;;
	4)
		f_descifrar
		;;
	5)
		f_instrucciones
		;;
	6)
		f_salir
		;;
	*)
		f_error
		;;
esac
}
while true; do f_main; done
