# MakeMeBetter (MMB)

## Just my make.

 1. Detecting `*.h` header files enable only in `./includes` folder. (and sub-dirs)
 2. Detecting `*.c` source code file enable only in `./src` folder. (and sub-dirs)
 3. Detecting `*.a` libraries enable only in `./libs` folder wia MMB as shown on `./libs/_example` folder.

## Requirements:

 - If `clang` is installed you needs to install and `llvm`-package with `llvm-ar` utilite. (only if you add any libraries to `./libs/`)
 - For compilation with `-m32` flag - use rule `x86` and install a `gcc-multilib` package. (or equivalent package as - `glibc-devel:i686` on Fedora)

## Note:
Also i have an [MMB installation script](https://github.com/Iipal/MakeMeBetterInstall) which can help you to initialize your project via MMB and install an useful aliases.

### Rules:

##### Default compilation flags for each rule is: `-Wall -Wextra -Werror -Wunused -MMD -std=c11`

| Rule               | Alias     | Description                                                                                                                 |
| ------------------ | --------- | --------------------------------------------------------------------------------------------------------------------------- |
| make               |           | Compiling a project with Optimization flags (`-march=native -mtune=native -Ofast -pipe -flto -fpic`)                        |
| make re            | re        | Re-compiling a whole project with Optimization flags                                                                        |
| make pre           | pre       | Re-compiling only executable sources without libraries re-compilation and with Optimization flags                           |
| make clean         | clean     | Delete *.d *.S and *.o files only                                                                                           |
| make clean_deps    | dclean    | Delete only *.d files                                                                                                       |
| make clean_asms    | aclean    | Delete only *.S files                                                                                                       |
| make fclean        | fclean    | The same as `clean` but deleting an executable and *.a libraries too                                                        |
| make debug         | debug     | Compiling a project with Debug flags (`-g3`)                                                                                |
| make debug_all     | debugr    | Re-compiling a whole project with Debug flags                                                                               |
| make sanitize      | sanitize  | Compiling a project with Sanitize flags (Debug flags + `-fsanitize=address`)                                                |
| make sanitize_all  | sanitizer | Re-compiling a whole project with Sanitize flags                                                                            |
| make x86           | x86       | Compiling a whole project with x86 flags (Optimization flags + `-m32`)                                                      |
| make x86_all       | x86r      | Re-compiling a whole project with x86 flags                                                                                 |
| make debug_x86     | dx86      | Compiling a whole project with Debug x86 flags (Debug flags + `-m32`)                                                       |
| make debug_x86_all | dx86r     | Re-ompiling a whole project with Debug x86 flags                                                                            |
| make pedantic      | pedantic  | Compiling a whole project with Pedantic flags (Optimization flags + `-Wpedantic`)                                           |
| make pedantic_all  | pedanticr | Re-compiling a whole project with Pedantic flags                                                                            |
| make assembly      | assembly  | Compiling a `*.S`-files for each `*.c` file with Assembly flags (`-march=native -mtune=native -Ofast -pipe -S -masm=intel`) |
| make assembly_all  | assemblyr | Re-compiling an all `*.S`-files for each `*.c` file with Assembly flags                                                     |
