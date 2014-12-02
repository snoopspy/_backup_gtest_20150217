win32-msvc* {
	DEFINES += _VARIADIC_MAX=10
}
DEFINES += GTEST

#-------------------------------------------------
# gtest
#-------------------------------------------------
GTEST_PATH = $${PWD}
INCLUDEPATH += $${GTEST_PATH}/include
win32 {
	contains(QMAKE_TARGET.arch, x86) {
		CONFIG(debug, debug|release) {
			contains(QMAKE_CFLAGS_DEBUG, -MDd) {
				LIBS += -L$${GTEST_PATH}/msvc/gtest-md/Debug -lgtestd -lgtest_maind
			}
			contains(QMAKE_CFLAGS_DEBUG, -MTd) {
				LIBS += -L$${GTEST_PATH}/msvc/gtest/Debug -lgtestd -lgtest_maind
			}
		}
		CONFIG(release, debug|release) {
			contains(QMAKE_CFLAGS_RELEASE, -MD) {
				LIBS += -L$${GTEST_PATH}/msvc/gtest-md/Release -lgtest -lgtest_main
			}
			contains(QMAKE_CFLAGS_RELEASE, -MT) {
				LIBS += -L$${GTEST_PATH}/msvc/gtest/Release -lgtest -lgtest_main
			}
		}
	}
	contains(QMAKE_TARGET.arch, x86_64) {
		CONFIG(debug, debug|release) {
			LIBS += -L$${GTEST_PATH}/msvc/x64/Debug -lgtestd -lgtest_main
		}
		win32:CONFIG(release, debug|release) {
			LIBS += -L$${GTEST_PATH}/msvc/x64/Release -lgtest -lgtest_main
		}
	}
}
gcc:LIBS += -L$${GTEST_PATH}/lib -lgtest -lgtest_main
