DEFINES+=_VARIADIC_MAX=10
DEFINES+=GTEST

#-------------------------------------------------
# gtest
#-------------------------------------------------
GTEST_PATH = $$PWD
INCLUDEPATH += $${GTEST_PATH}/include
win32:contains(QMAKE_TARGET.arch, x86_64) {
  win32:CONFIG(debug, debug|release) {
    LIBS += -L$${GTEST_PATH}/msvc/x64/Debug -lgtestd
  }
  win32:CONFIG(release, debug|release) {
    LIBS += -L$${GTEST_PATH}/msvc/x64/Release -lgtest
  }
} else {
  win32:CONFIG(debug, debug|release) {
    contains(QMAKE_CFLAGS_DEBUG, -MDd) {
      LIBS += -L$${GTEST_PATH}/msvc/gtest-md/Debug -lgtestd
    }
    contains(QMAKE_CFLAGS_DEBUG, -MTd) {
      LIBS += -L$${GTEST_PATH}/msvc/gtest/Debug -lgtestd
    }
  }
  win32:CONFIG(release, debug|release) {
    contains(QMAKE_CFLAGS_RELEASE, -MD) {
      LIBS += -L$${GTEST_PATH}/msvc/gtest-md/Release -lgtest
    }
    contains(QMAKE_CFLAGS_RELEASE, -MT) {
      LIBS += -L$${GTEST_PATH}/msvc/gtest/Release -lgtest
    }
  }
}
linux:LIBS += -L$${GTEST_PATH} -lgtest
