# Description: Generate a class with its .hpp and .cpp files
# Usage: class_gen class_name
# Example: class_gen AwesomeClass
# Output: AwesomeClass.hpp and AwesomeClass.cpp in cannonical form
# Note: The class will be generated in the current directory

cpp_class_gen()
{
    echo "#include \"$1.hpp\"" >> $1.cpp
    echo "" >> $1.cpp
    echo "$1::$1(void)" >> $1.cpp
    echo "{" >> $1.cpp
    echo "    // std::cout << \"$1: Default constructor called\" << std::endl;" >> $1.cpp
    echo "    return ;" >> $1.cpp
    echo "}" >> $1.cpp
    echo "" >> $1.cpp
    echo "$1::$1($1 const & src)" >> $1.cpp
    echo "{" >> $1.cpp
    echo "    // std::cout << \"$1: Copy constructor called\" << std::endl;" >> $1.cpp
    echo "    *this = src;" >> $1.cpp
    echo "    return ;" >> $1.cpp
    echo "}" >> $1.cpp
    echo "" >> $1.cpp
    echo "$1::~$1(void)" >> $1.cpp
    echo "{" >> $1.cpp
    echo "    // std::cout << \"$1: Destructor called\" << std::endl;" >> $1.cpp
    echo "    return ;" >> $1.cpp
    echo "}" >> $1.cpp
    echo "" >> $1.cpp
    echo "$1 & $1::operator=($1 const & src)" >> $1.cpp
    echo "{" >> $1.cpp
    echo "    if (this != &src)" >> $1.cpp
    echo "    {" >> $1.cpp
    echo "        // std::cout << \"$1: Assignation operator called\" << std::endl;" >> $1.cpp
    echo "    }" >> $1.cpp
    echo "    return *this;" >> $1.cpp
    echo "}" >> $1.cpp
    echo "" >> $1.cpp
    echo "// std::ostream & operator<<(std::ostream & o, $1 const & src)" >> $1.cpp
    echo "// {" >> $1.cpp
    echo "//     o << \"ostream operator called\";" >> $1.cpp
    echo "//     return o;" >> $1.cpp
    echo "// }" >> $1.cpp
    echo "" >> $1.cpp
    echo -e "\033[32m$1.cpp created!\033[0m"
}

hpp_class_gen()
{
    echo "#pragma once" >> $1.hpp
    echo "" >> $1.hpp
    echo "#include <iostream>" >> $1.hpp
    echo "" >> $1.hpp
    echo "class $1" >> $1.hpp
    echo "{" >> $1.hpp
    echo "" >> $1.hpp
    echo "public:" >> $1.hpp
    echo "    $1(void);" >> $1.hpp
    echo "    $1($1 const & src);" >> $1.hpp
    echo "    ~$1(void);" >> $1.hpp
    echo "" >> $1.hpp
    echo "    $1 & operator=($1 const & src);" >> $1.hpp
    echo "};" >> $1.hpp
    echo "" >> $1.hpp
    echo "// std::ostream & operator<<(std::ostream & o, $1 const & src);" >> $1.hpp
    echo "" >> $1.hpp
    echo -e "\033[32m$1.hpp created!\033[0m"
}

class_gen()
{
    if [ $# -ne 1 ]; then
        echo "Usage: class_gen class_name"
        return
    fi
    hpp_class_gen $1
    cpp_class_gen $1
}
