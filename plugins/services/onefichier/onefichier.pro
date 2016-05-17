QT += core network
CONFIG += plugin
TARGET = onefichier
TEMPLATE = lib

greaterThan(QT_MAJOR_VERSION, 4) {
    QT -= gui
}

HEADERS += onefichierplugin.h
SOURCES += onefichierplugin.cpp

config.files = onefichier.json
icon.files = onefichier.jpg

unix {
    INCLUDEPATH += /usr/include/qdl2
    HEADERS += /usr/include/qdl2/serviceplugin.h
    
    config.path = /opt/qdl2/plugins/services
    icon.path = /opt/qdl2/plugins/icons
    target.path = /opt/qdl2/plugins/services
    
    INSTALLS += \
        target \
        config \
        icon
}
