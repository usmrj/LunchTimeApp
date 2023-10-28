#include "DateTime.h"
#include <QDateTime>
#include <QTimer>

DateTime::DateTime(QObject *parent)
    : QObject{parent}
    , m_CurrentTime{QDateTime::currentDateTime().time().toString()}
    , m_CurrentDate{QString::number(QDateTime::currentDateTime().date().day()) + " " + QString::number(QDateTime::currentDateTime().date().month())}
    , RefreshDateTimer(new QTimer)
{
    if(RefreshDateTimer != nullptr)
    {
        connect(RefreshDateTimer, &QTimer::timeout, this, &DateTime::UpdateDateTime);
        RefreshDateTimer->start((60 - QDateTime::currentDateTime().time().second()) * 1000);
    }

    m_CurrentTime.chop(3);
    FormatDate(m_CurrentDate);
}

DateTime::~DateTime()
{
    delete RefreshDateTimer;
}

QString DateTime::CurrentTime() const
{
    return m_CurrentTime;
}

void DateTime::setCurrentTime(const QString &newCurrentTime)
{
    if (m_CurrentTime == newCurrentTime)
        return;
    m_CurrentTime = newCurrentTime;
    emit CurrentTimeChanged();
}

QString DateTime::CurrentDate() const
{
    return m_CurrentDate;
}

void DateTime::setCurrentDate(const QString &newCurrentDate)
{
    if (m_CurrentDate == newCurrentDate)
        return;
    m_CurrentDate = newCurrentDate;
    emit CurrentDateChanged();
}

void DateTime::UpdateDateTime()
{
    if(RefreshDateTimer->interval() != 60000)
    {
        RefreshDateTimer->setInterval(60000);
    }

    const QDateTime& CurrentDateTime = QDateTime::currentDateTime();

    QString NewTime = CurrentDateTime.time().toString();
    NewTime.chop(3);

    if(CurrentDateTime.time().hour() == 0 && CurrentDateTime.time().minute() == 0 && m_CurrentTime[0] == '2' && m_CurrentTime[1] == '3')
    {
        qDebug() << "send survey";
        QString NewDate = QString::number(QDateTime::currentDateTime().date().day()) + " " + QString::number(QDateTime::currentDateTime().date().month());
        FormatDate(NewDate);
        setCurrentDate(NewDate);

        //send survey...
    }

    setCurrentTime(NewTime);
}

void DateTime::FormatDate(QString &OutDate)
{
    auto chaneMonth = [](int month) -> QString
    {
        static std::map<int, std::string> monthNames =
            {
                {1, "Sty"},
                {2, "Lut"},
                {3, "Mar"},
                {4, "Kwi"},
                {5, "Maj"},
                {6, "Cze"},
                {7, "Lip"},
                {8, "Sie"},
                {9, "Wrz"},
                {10, "Paź"},
                {11, "Lis"},
                {12, "Gru"}
            };

        return QString::fromStdString(monthNames[month]);
    };

    QStringList list = OutDate.split(" ");

    bool bChanged = false;
    for(QString& Number : list)
    {
        if(Number.size() != 2)
        {
            bChanged = true;
            Number = "0" + Number;
        }
    }

    if(bChanged)
        OutDate = list[0] + " " + list[1];

    m_CurrentDate.replace(3, 4, chaneMonth(m_CurrentDate.sliced(2, 3).toInt()));

    if(OutDate[0] == '0')
    {
        OutDate.remove(0, 1);
    }
}
