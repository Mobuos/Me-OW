CPPS = main.cpp Game.cpp Object.cpp ObjectsQueue.cpp ObjectsList.cpp Player.cpp Collision.cpp
OBJS = main.o Game.o Object.o ObjectsQueue.o ObjectsList.o Player.o Collision.o
windows: compile wlink wmove wrun
linux: compile llink lmove lrun
	
compile: 
	g++ -Isrc/include -c $(CPPS)

wlink:
	g++ $(OBJS) -o main-windows -Lsrc/lib -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio

llink:
	g++ $(OBJS) -o main-linux -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio

wmove:
	move "main.exe" "Final\main.exe"
	xcopy "resources" "Final\resources" /D /I /E /F /Y /H /R

wrun:
	Final/main-windows.exe

lmove:
	mv main-linux Final
	find . -name "*.o" -type f -delete

lrun:
	./Final/main-linux