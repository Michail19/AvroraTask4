#include "Counter.h"

void Counter::setValue(int value)
{
    if (m_value != value) {
        m_value = value;
        emit valueChanged(m_value);
    }
}

void Counter::increment()
{
    setValue(m_value + 1);
}

void Counter::reset()
{
    setValue(0);
}
