#include "Data.h"
#include "Source/Cpp/Data/Database/Database.h"
#include "Source/Cpp/Data/Time/DateTime.h"
#include <QDebug>
#include <QtConcurrent>

Data::Data(QObject *parent)
    : QObject{parent}
    , m_Database{new Database}
    , m_loading(true)
{
    if(m_Database != nullptr)
    {
        QFuture<void> future = QtConcurrent::run(m_Database->Connect).then([this]()
        {
            const QJsonDocument& result1 = m_Database->Query("SELECT * FROM Dishes");
            qDebug() << result1;

            setLoading(false);
        });
    }
}

Data::~Data()
{
    delete m_Database;
}

bool Data::loading() const
{
    return m_loading;
}

void Data::setLoading(bool newLoading)
{
    if (m_loading == newLoading)
        return;
    m_loading = newLoading;
    emit loadingChanged();
}

QString Data::getQrContent() const
{
    return "test";
}
