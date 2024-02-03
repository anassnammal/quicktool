# Cpp tools for repetitive work
script to automate some repetitive work in cpp
## How to use
1. Clone the repository
2. Run the script (./leetQuickTools.sh)

## Features
1. Start a new C++ project and generate required files
2. Generate a new C++ class in cannical form
3. A little make extension to make and test your cpp days exercise quickly

## how to use the features

### To start a new C++ project and generate required files
```bash
$> cpp_gen
Enter project name:
## type the project name, it will be used for executable name
Enter project dirname:
## type the project directory name
Do you want to create a git repository? (y/n)
## y to init a git repository, n to skip
Do you want separate directories for headers and sources? (y/n)
## y to create separate directories for headers and sources, n to skip
Enter files to create (separated by spaces):
## type the file names you want to create (e.g. Makefile main Class1 Class2 utils ...)
```
NOTE: if the project consists of classes, you may only type the class names in UpperCamelCase, the script will automatically generate the .hpp and .cpp files in canonical form
the same goes for the Makefile, it will be generated with the correct dependencies

### To generate a new C++ class in canonical form
```bash
$> class_gen Class1
```
this will generate a .hpp and .cpp file in canonical form

### To make and test your cpp days exercise quickly
```bash
$> mk 2
```
this will compile and run the 2nd exercise (ex02) in the current directory
then it will copy the executable to the current directory.

```bash
$> mk fclean 3
```
this will call make fclean of the 3rd exercise (ex03) in the current directory

## Author
- anammal

## License
this is just a script, I made to avoid repetitive work, feel free to use it and modify it as you like
