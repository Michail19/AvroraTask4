#include <auroraapp.h>
#include <QtQuick>

#include "StringListManager.h"

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.template"));
    application->setApplicationName(QStringLiteral("StringListManager"));

    qmlRegisterType<StringListManager>("com.example", 1, 0, "StringListManager");

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/StringListManager.qml")));
    view->show();

    return application->exec();
}
