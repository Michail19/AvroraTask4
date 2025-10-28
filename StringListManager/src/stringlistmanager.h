#ifndef STRINGLISTMANAGER_H
#define STRINGLISTMANAGER_H

#include <QObject>
#include <QStringList>

class StringListManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString formattedList READ formattedList NOTIFY listChanged)

public:
    explicit StringListManager(QObject *parent = nullptr) : QObject(parent) {}

    QString formattedList() const;

public slots:
    void addString(const QString &text);
    void removeLastString();

private:
    QStringList m_stringList;

signals:
    void listChanged();
};

#endif // STRINGLISTMANAGER_H
