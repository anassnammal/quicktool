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
$> Enter project name:
$> executable_name
Enter project dirname:
$> dir_name
Do you want to create a git repository? (y/n)
$> y to create a git repository and generate a .gitignore file, n to skip
Do you want separate directories for headers and sources? (y/n)
$> y to create separate directories for headers and sources, n to skip
Enter files to create (separated by spaces):
$> Makefile main utils Class1 Class2
```
NOTE: to generate the required files, you simply need to enter the file names separated by spaces.
    if the File name begins with a capital letter, the script will generate a .hpp and .cpp in canonical form,
    otherwise, it will generate an empty .cpp file only.

### To generate a new C++ class in canonical form
```bash
$> class_gen <class_name>
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
```


## Author
- anammal