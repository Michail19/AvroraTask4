#include <auroraapp.h>
#include <QtQuick>
#include <QQmlEngine>
#include <QQmlContext>

#include "Counter.h"

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.template"));
    application->setApplicationName(QStringLiteral("Counter"));

    qmlRegisterType<Counter>("com.example", 1, 0, "Counter");

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/Counter.qml")));
    view->show();

    return application->exec();
}
