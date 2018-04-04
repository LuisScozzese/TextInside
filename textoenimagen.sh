#!/bin/bash



f_error() {
	echo
	echo -e "\e[1;31m 		*OPCION INVALIDA*"
	echo
	echo
	sleep 2
	f_main
}
f_imagen(){
	echo -e "\e[1;32mElija o descargue cualquier imagen con formato .JPG\e[0m"
	echo -e "\e[1;32my renombrela como 'imagen.jpg' para que la herramienta funcione correctamente\e[0m"
	sleep 10
	f_main
	

}
f_instalar(){
	echo -e "\e[1;32mLa herramienta se esta instalando\e[0m"
	echo -e "\e[1;31m" 
	apt-get install steghide
	echo -e "\e[0m"
	sleep 2
	echo -e "\e[1;32m=====LA HERRAMIENTA HA SIDO INSTALADA CON EXITO=====\e[0m"
	sleep 5
	f_main
}
f_instrucciones(){
	echo -e "\e[1;36mEsta herramienta esta hecha con fines educativos"
	echo -e "cabe destacar que tanto la imagen como el .txt tienen"
	echo -e "que estar en el escritorio para que funcione, y que al insertar"
	echo -e "y descifrar les pedira una clave que elegiran ustedes o el que le"
	echo -e "envie la imagen.\e[0m"
	sleep 15
}
f_mensaje(){
	echo -e "\e[1;32mEscriba un mensaje y guardelo como secreto.txt"
	sleep 2	
	echo -e "Espere mientras abre el editor..\e[0m"
	sleep 1
	gedit
	f_main
	
}
f_salir(){
	echo
	echo -e "\e[1;36mNOS VEMOS!\e[0m"
	exit

}
f_banner(){
echo -e "\e[1;32m               °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°\e[0m"
echo -e "\e[1;32m             °°°°°°\e[0m\e[1;31mESCONDER TEXTO EN UNA IMAGEN V2.1 by Luis Scozzese\e[0m\e[1;32m°°°°°°\e[0m"
echo -e "\e[1;32m               °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°\e[0m"
echo             
}
f_insertar(){
	echo "¿HAS CUMPLIDO CON LOS REQUISITOS ANTERIORES?"
	echo
	echo -e "\e[1;32m[01] SI\e[0m"
	echo
	echo -e "\e[1;31m[02] NO\e[0m"
	echo
	read RESPUESTA

	case $RESPUESTA in
		1)
			steghide embed -cf imagen.jpg -ef secreto.txt
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
	echo "DEBE RENOMBRAR LA IMAGEN A DESCIFRAR COMO imagen.jpg"
	echo
	echo -e "\e[1;32m[01] YA LO HICE\e[0m"
	echo
	echo -e "\e[1;31m[02] NO LO HE HECHO\e[0m"
	echo
	read LOHICE

	case $LOHICE in
		1)
			steghide extract -sf imagen.jpg
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
echo -e "\e[1;36m QUÉ OPCIÓN DESEA EJECUTAR\e[0m"
echo

echo -e "\e[1;37m[01] INSTALAR LA HERRAMIENTA STEGHIDE"
echo
echo -e "[02] INSTRUCCIONES IMAGEN"
echo 
echo -e "[03] CREAR UN MENSAJE"
echo
echo -e "[04] INSERTAR EL MENSAJE EN UNA IMAGEN"
echo
echo -e "[05] DESCIFRAR EL MENSAJE DE UNA IMAGEN"
echo
echo -e "[06] INSTRUCCIONES"
echo
echo -e "[07] SALIR\e[0m"
echo
read OPCION

case $OPCION in
	1)
		f_instalar
		;;
	2)
		f_imagen
		;;
	3)
		f_mensaje
		;;
	4)
		f_insertar
		;;
	5)
		f_descifrar
		;;
	6)
		f_instrucciones
		;;
	7)
		f_salir
		;;
	*)
		f_error
		;;
esac
}
while true; do f_main; done
