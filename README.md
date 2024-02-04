# Cpp tools for repetitive work
script to automate some repetitive work in cpp
## How to use
1. Clone the repository
2. Run the script (./install.sh)

## Features
1. Start a new C++ project and generate required files
2. Generate a new C++ class in canonical form
3. A little make extension to make and test your cpp days exercise quickly

## how to use the features

### To start a new C++ project and generate required files
```bash
➜ cpp_gen
__Cpp project generator__
Enter project name:
foo ## type the project name, it will be used for executable name
Enter project dirname:
foodir ## type the project directory name
Do you want to create a git repository? (y/n)
y ## y to init a git repository, n to skip
Do you want separate directories for headers and sources? (y/n)
y ## y to create separate directories for headers and sources, n to skip
Enter files to create (separated by spaces):
Makefile main Foo Class utils ## type the file names you want to create (class names in UpperCamelCase)
```
output :
```
Initialized empty Git repository in /Users/anammal/Desktop/cpp/cpp/foodir/.git/
.gitignore created!
src/main.cpp created!
src/utils.cpp created!
src/Foo.cpp created!
src/Class.cpp created!
inc/Foo.hpp created!
inc/Class.hpp created!
Makefile created!
Project generated!
```
NOTE: if the project consists of classes, you may only type the class names in UpperCamelCase, the script will automatically generate the .hpp and .cpp files in canonical form
the same goes for the Makefile, it will be generated with the correct dependencies

### To generate a new C++ class in canonical form
```bash
➜ cpp_gen Foo Bar
```
output
```bash
./Foo.hpp created!
./Foo.cpp created!
./Bar.hpp created!
./Bar.cpp created!
```
this will generate a .hpp and .cpp file in canonical form

### To make and test your cpp days exercise quickly
```bash
➜ ls
CppModule01.pdf ex00            ex01            ex02            ex03            ex04            ex05            ex06
➜ mk 6
c++ -std=c++98 -Wall -Wextra -Werror -c main.cpp
c++ -std=c++98 -Wall -Wextra -Werror -c Harl.cpp
c++ -std=c++98 -Wall -Wextra -Werror main.o Harl.o -o HarlFilter
➜ ls
CppModule01.pdf *HarlFilter      ex00            ex01            ex02            ex03            ex04            ex05            ex06
➜ ./HarlFilter
```
this will compile exercise (ex06) from the current directory
then it will copy the executable to the current directory.

```bash
➜ mk fclean 6
```
this will call make fclean of the 3rd exercise (ex03) in the current directory

## Author
- anassnammal

## License
this is just a script, I made to avoid repetitive work, feel free to use it and modify it as you like
