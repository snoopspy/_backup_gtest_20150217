# How to build
    ./configure --enable-shared=no
    make

# Result
    # ll lib -R
    lib:
    total 20
    ./
    ../
    .dirstamp
    libgtest.la
    libgtest_main.la
    .libs/
    
    lib/.libs:
    ./
    ../
    libgtest.a
    libgtest.la -> ../libgtest.la
    libgtest.lai
    libgtest_main.a
    libgtest_main.la -> ../libgtest_main.la
    libgtest_main.lai

# How to Use
    -L$PWD/lib -lgtest


