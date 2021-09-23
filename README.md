# Night Script

A command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

Nigh Script is a 3d graphics scripting language that is designed to be simple, easy to read and interoperable with JavaScript and C++ by compiling source to source to these languages. During compilation, a night script file is compiled to one javascript or one .hpp and one .cxx file.

We aim to use the language as the scripting language for the Linyard Game Engine, which targets KaiOS devices via JavaScript and mobile devices via C++.

## Q: If we don't intepret Night Script, how are we going to implement Flutter-like hot reload in Linyard
A: For javascript, we will use [this](https://github.com/michaellee8/flutter_web_hot_reload) method. For C++ we will compile night script sources to .so file and just remap the procedures from a global lookup table, meaning it will be similar to the JS implementation.

## Q: Can night script programms be run as standalone
A: No, you need to compile them to JavaScript or Cpp and then run the output with your compiler tools for these two targets. We have designed the compilation process for night script with the assumption that generated files will be imported in an already setup project.

## Q: Besides the compiler, which other tools does the night script SDK provide
A: We plan to provide the following:
1. A package manager to allow for distribution and resuing of night scripts
2. IDE extension for VSCode
3. A formatter

## Q: Will night script have a standard library
A: Yes, A library that provides packages and algorithms common to both JS and Cpp environments. for example JSON encoding and decoding, a math library, typed buffers, data structures and collections, printing to console, extensions to the basic types, etc.
