# Description: C++ project generator
# Example:
#       Enter project name:
#           Polymorphism
#       Enter project dirname:
#           ex00
#       Do you want to create a git repository? (y/n)
#           n
#       Do you want separate directories for headers and sources? (y/n)
#           n
#       Enter files to create (separated by spaces):
#           main Makefile Animal Cat Dog
#   NOTICE :
#       - If you want to create a class, the name must start with a capital letter 
#            - .hpp and .cpp is generated in cannonical form.
#       - If name starts with a lowercase letter, it will be considered as a normal source file.
#            - an empty .cpp is generated.

cpp_class_gen()
{
    echo "#include \"$1.hpp\"" >> $2
    echo "" >> $2
    echo "$1::$1(void)" >> $2
    echo "{" >> $2
    echo "    // std::cout << \"$1: Default constructor called\" << std::endl;" >> $2
    echo "    return ;" >> $2
    echo "}" >> $2
    echo "" >> $2
    echo "$1::$1($1 const & src)" >> $2
    echo "{" >> $2
    echo "    // std::cout << \"$1: Copy constructor called\" << std::endl;" >> $2
    echo "    *this = src;" >> $2
    echo "    return ;" >> $2
    echo "}" >> $2
    echo "" >> $2
    echo "$1::~$1(void)" >> $2
    echo "{" >> $2
    echo "    // std::cout << \"$1: Destructor called\" << std::endl;" >> $2
    echo "    return ;" >> $2
    echo "}" >> $2
    echo "" >> $2
    echo "$1 & $1::operator=($1 const & src)" >> $2
    echo "{" >> $2
    echo "    if (this != &src)" >> $2
    echo "    {" >> $2
    echo "        // std::cout << \"$1: Copy assignation operator called\" << std::endl;" >> $2
    echo "    }" >> $2
    echo "    return *this;" >> $2
    echo "}" >> $2
    echo "" >> $2
    echo "// std::ostream & operator<<(std::ostream & o, $1 const & src)" >> $2
    echo "// {" >> $2
    echo "//     o << \"ostream operator called\";" >> $2
    echo "//     return o;" >> $2
    echo "// }" >> $2
    echo "" >> $2
    echo -e "\033[32m$2 created!\033[0m"
}

hpp_class_gen()
{
    echo "#pragma once" >> $2
    echo "" >> $2
    echo "#include <iostream>" >> $2
    echo "" >> $2
    echo "class $1" >> $2
    echo "{" >> $2
    echo "" >> $2
    echo "public:" >> $2
    echo "    $1(void);" >> $2
    echo "    $1($1 const & src);" >> $2
    echo "    ~$1(void);" >> $2
    echo "" >> $2
    echo "    $1 & operator=($1 const & src);" >> $2
    echo "};" >> $2
    echo "" >> $2
    echo "// std::ostream & operator<<(std::ostream & o, $1 const & src);" >> $2
    echo "" >> $2
    echo -e "\033[32m$2 created!\033[0m"
}

mkf_gen()
{
    echo "NAME = $NAME" >> Makefile
    echo "SRCS = $MAINFILE ${CPPFILES[@]}" >> Makefile
    echo "OBJS = \$(patsubst %.cpp, %.o, \$(SRCS))" >> Makefile
    echo "INCS = ${CPPFILES[@]}" >> Makefile
    echo "CPPFLAGS = -std=c++98 -Wall -Wextra -Werror" >> Makefile
    echo "CC = c++" >> Makefile
    echo "" >> Makefile
    echo "all: \$(NAME)" >> Makefile
    echo "" >> Makefile
    echo "\$(NAME): \$(OBJS) \$(INCS)" >> Makefile
    echo "	\$(CC) \$(CPPFLAGS) \$(OBJS) -o \$(NAME)" >> Makefile
    echo "" >> Makefile
    if [[ $SUBDIRS == "y" ]]; then
        echo "$OBJDIR:" >> Makefile
        echo "	mkdir $OBJDIR" >> Makefile
        echo "" >> Makefile
        echo "$OBJDIR%.o: $SRCDIR%.cpp ${HPPFILES[@]} $OBJDIR" >> Makefile
        echo "	\$(CC) \$(CPPFLAGS) -c $< -I $INCDIR -o \$@" >> Makefile
    else
        echo "%.o: %.cpp ${HPPFILES[@]}" >> Makefile
        echo "	\$(CC) \$(CPPFLAGS) -c $< -o \$@" >> Makefile
    fi
    echo "" >> Makefile
    echo "clean:" >> Makefile
    echo "	rm -f \$(OBJS)" >> Makefile
    echo "" >> Makefile
    echo "fclean: clean" >> Makefile
    echo "	rm -f \$(NAME)" >> Makefile
    echo "" >> Makefile
    echo "re: fclean all" >> Makefile
    echo "" >> Makefile
    echo ".PHONY: all clean fclean re" >> Makefile
    echo "" >> Makefile
    echo -e "\033[32mMakefile created!\033[0m"
}

cpp_gen()
{
    echo "__Cpp project generator__"

    echo "Enter project name:"
    read NAME

    echo "Enter project dirname:"
    read DIRNAME

    echo "Do you want to create a git repository? (y/n)"
    read GIT

    echo "Do you want separate directories for headers and sources? (y/n)"
    read SUBDIRS

    echo "Enter files to create (separated by spaces):"
    read FILES

    EMPTYCPPFILES=()
    CPPFILES=()
    HPPFILES=()
    MAKEFILE=0
    MAINFILE=""
    SRCDIR=""
    OBJDIR=""
    INCDIR=""

    mkdir $DIRNAME && cd $DIRNAME

    if [[ $SUBDIRS == "y" ]]; then
        SRCDIR="src/"
        OBJDIR="obj/"
        INCDIR="inc/"
        mkdir src inc
    fi

    for FILE in $FILES; do
        if [[ $FILE == "Makefile" ]]; then
            MAKEFILE=1
        elif [[ $FILE == "main" ]]; then
            MAINFILE="$SRCDIR$FILE.cpp"
        elif [[ $FILE =~ ^[A-Z] ]]; then
            CPPFILES+=("$SRCDIR$FILE.cpp")
            HPPFILES+=("$INCDIR$FILE.hpp")
        else
            EMPTYCPPFILES+=("$SRCDIR$FILE.cpp")
        fi
    done

    if [[ $GIT == "y" ]]; then
        git init
        touch .gitignore
        echo ".DS_Store" >> .gitignore
        echo "a.out" >> .gitignore
        echo "obj" >> .gitignore
        echo "$NAME" >> .gitignore
        echo "*.o" >> .gitignore
        echo ".vscode/" >> .gitignore
        echo "*.dSYM/" >> .gitignore
        echo "" >> .gitignore
    fi

    echo -e "\033[32mGenerating files...\033[0m"

    if [[ $MAINFILE != "" ]]; then
        touch $MAINFILE
        for FILE in ${HPPFILES[@]}; do
            BASENAME=$(basename $FILE .cpp)
            echo "#include \"$BASENAME\"" >> $MAINFILE
        done
        echo "" >> $MAINFILE
        echo "int main(void)" >> $MAINFILE
        echo "{" >> $MAINFILE
        echo "    // std::cout << \"Hello world!\" << std::endl;" >> $MAINFILE
        echo "    return 0;" >> $MAINFILE
        echo "}" >> $MAINFILE
        echo "" >> $MAINFILE
        echo -e "\033[32m$MAINFILE created!\033[0m"
    fi


    for FILE in ${EMPTYCPPFILES[@]}; do
        touch $FILE
        echo "" >> $FILE
        echo "void foo(void)" >> $FILE
        echo "{" >> $FILE
        echo "    // std::cout << \"Hello world!\" << std::endl;" >> $FILE
        echo "    return ;" >> $FILE
        echo "}" >> $FILE
        echo "" >> $FILE
        echo -e "\033[32m$FILE created!\033[0m"
    done

    for FILE in ${CPPFILES[@]}; do
        touch $FILE
        BASENAME=$(basename $FILE .cpp)
        cpp_class_gen $BASENAME $FILE
    done

    for FILE in ${HPPFILES[@]}; do
        touch $FILE
        BASENAME=$(basename $FILE .hpp)
        hpp_class_gen $BASENAME $FILE
    done

    if [[ $MAKEFILE == 1 ]]; then
        touch Makefile
        mkf_gen
    fi

    echo -e "\033[32mProject generated!\033[0m"
}
