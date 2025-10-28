#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY (int value READ value WRITE setValue NOTIFY valueChanged)

public:
    Counter() { m_value = 0; }
    int value() const { return m_value; }

public slots:
     void setValue(int value);
     void increment();
     void reset();


signals:
     void valueChanged(int newValue);

private:
     int m_value;

};

#endif // COUNTER_H
