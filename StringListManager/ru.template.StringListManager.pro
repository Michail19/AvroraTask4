TARGET = ru.template.StringListManager

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \
    src/stringlistmanager.cpp

HEADERS += \
    src/stringlistmanager.h

DISTFILES += \
    rpm/ru.template.StringListManager.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.template.StringListManager.ts \
    translations/ru.template.StringListManager-ru.ts \
