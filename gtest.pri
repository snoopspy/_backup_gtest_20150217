CONFIG += GTEST
DEFINES += GTEST

#-------------------------------------------------
# gtest
#-------------------------------------------------
GTEST_PATH = $${PWD}
INCLUDEPATH += $${GTEST_PATH}/include
LIBS += -L$${GTEST_PATH}/lib -lgtest -lgtest_main
