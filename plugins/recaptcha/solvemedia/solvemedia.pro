QT += network
CONFIG += plugin
TARGET = qdl2-solvemediarecaptcha
TEMPLATE = lib

HEADERS += \
    json.h \
    solvemediarecaptchaplugin.h

SOURCES += \
    json.cpp \
    solvemediarecaptchaplugin.cpp

symbian {
    TARGET.UID3 = 0xE71AB32B
    TARGET.CAPABILITY += NetworkServices ReadUserData WriteUserData
    TARGET.EPOCALLOWDLLDATA = 1
    TARGET.EPOCHEAPSIZE = 0x20000 0x8000000
    TARGET.EPOCSTACKSIZE = 0x14000

    INCLUDEPATH += ../../src
    HEADERS += ../../src/recaptchaplugin.h

    vendorinfo += "%{\"Stuart Howarth\"}" ":\"Stuart Howarth\""
    solvemediarecaptcha_deployment.pkg_prerules += vendorinfo

    config.sources = "$$TARGET".json
    config.path = !:/qdl2/plugins/recaptcha

    icon.sources = "$$TARGET".jpg
    icon.path = !:/qdl2/plugins/icons

    lib.sources = "$$TARGET".dll
    lib.path = !:/sys/bin

    stub.sources = "$$TARGET".qtplugin
    stub.path = !:/qdl2/plugins/recaptcha

    DEPLOYMENT.display_name = QDL Plugins Solve Media Recaptcha
    DEPLOYMENT += \
        solvemediarecaptcha_deployment \
        config \
        icon \
        lib \
        stub

} else:unix {
    INCLUDEPATH += /usr/include/qdl2
    HEADERS += /usr/include/qdl2/recaptchaplugin.h

    config.files = "$$TARGET".json
    config.path = /opt/qdl2/plugins/recaptcha

    icon.files = "$$TARGET".jpg
    icon.path = /opt/qdl2/plugins/icons

    target.path = /opt/qdl2/plugins/recaptcha

    INSTALLS += \
        config \
        icon \
        target
}
