#include "StringListManager.h"
#include <QDebug>

QString StringListManager::formattedList() const
{
    if (m_stringList.isEmpty()) {
        return "";
    }

    QStringList formattedStrings = m_stringList;

    if (!formattedStrings.isEmpty()) {
        QString firstWord = formattedStrings.first();
        if (!firstWord.isEmpty()) {
            firstWord[0] = firstWord[0].toUpper();
            formattedStrings[0] = firstWord;
        }
    }

    return formattedStrings.join(", ");
}

void StringListManager::addString(const QString &text)
{
    if (!text.trimmed().isEmpty()) {
        QString processedText = text.trimmed().toLower();
        m_stringList.append(processedText);
        emit listChanged();
        qDebug() << "Added string:" << processedText;
    }
}

void StringListManager::removeLastString()
{
    if (!m_stringList.isEmpty()) {
        QString removed = m_stringList.takeLast();
        emit listChanged();
        qDebug() << "Removed string:" << removed;
    }
}
