TARGET = ru.template.Counter

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/counter.cpp \
    src/main.cpp \

HEADERS += \
    src/counter.h

DISTFILES += \
    rpm/ru.template.Counter.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.template.Counter.ts \
    translations/ru.template.Counter-ru.ts \
