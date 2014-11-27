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

# Main code
    #include <gtest/gtest.h>
    #include <pthread.h>

    void resolvePthreadLinkError()
    {
    	pthread_key_t key = -1;
    	pthread_key_delete(key);
    }
    
    int main(int argc, char* argv[])
    {
    	::testing::InitGoogleTest(&argc, argv);
    	return RUN_ALL_TESTS();
    }

