motors.o: motors.s
	arm-eabi-as motors.s -o motors.o 
    
motors: motors.o
	arm-eabi-ld motors.o -o motors -Ttext=0x77802000
	
disk.img: motors
	mksd.sh --so /home/specg12-1/mc404/simulador/simulador_player/bin/knrl --user motors 

SIM: disk.img
	armsim_player --rom=/home/specg12-1/mc404/simulador/simulador_player/bin/dumboot.bin --sd=disk.img 
	
inicio:
	source /home/specg12-1/mc404/simulador/set_path.sh

    
