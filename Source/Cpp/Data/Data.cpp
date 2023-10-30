#include "Data.h"
#include "Source/Cpp/Data/Database/Database.h"
#include <QDebug>
#include <QtConcurrent>
#include <QCryptographicHash>

Data::Data(QObject *parent)
    : QObject{parent}
    , m_Database{new Database}
    , m_loading{true}
    , m_sendingSurvey{false}
{
    if(m_Database != nullptr)
    {
        QFuture<void> future = QtConcurrent::run(m_Database->Connect).then([this]()
        {
            const QJsonDocument& result1 = m_Database->Query("SELECT * FROM Dishes");
            //qDebug() << result1;

            RetrieveWeekServings();

            setLoading(false);
        });
    }

    WeekDishes.insert(1, {"Zupa", "Schabowy", "Ziem", "Kap"});
}

Data::~Data()
{
    delete m_Database;
}

void Data::RetrieveWeekServings()
{
    const QJsonDocument& result1 = m_Database->Query("SELECT * FROM ServedDishes");
    //qDebug() << result1;
}

QString Data::getDish(int InDay, int Value) const
{
    switch(Value)
    {
        case 1:
        return WeekDishes[InDay].FirstDish;
        break;

        case 2:
        return WeekDishes[InDay].MainDish;
        break;

        case 3:
        return WeekDishes[InDay].Ingr1;
        break;

        case 4:
        return WeekDishes[InDay].Ingr2;
        break;

        default:
        break;
    }

    return "";
}

void Data::sendSurvey(int Choice)
{
    if(m_Database != nullptr)
    {
        setSendingSurvey(true);

        QFuture<void> future = QtConcurrent::run(m_Database->Connect).then([this, &Choice]()
        {
            QString Query = "INSERT INTO `Feedback` (`feedback`, `StudentId`, `SchoolId`, `DishId`) VALUES ('choice', '1', '2', '3');";
            Query.replace("choice", QString::number(Choice));

            m_Database->QueryNoRet(Query);

            setSendingSurvey(false);
        });
    }
}

void Data::tryLogin(const QString &StudentNumber, const QString &Password)
{
    if(m_Database != nullptr)
    {
        QFuture<void> future = QtConcurrent::run(m_Database->Connect).then([this, &Password, &StudentNumber]()
        {
            QByteArray Bytes = QCryptographicHash::hash(Password.toUtf8(), QCryptographicHash::Blake2s_256);
            QString Hashed = QString(Bytes.toHex());

            QString Query = "SELECT * FROM `students` WHERE password = 'password' AND StudentId = 'studentId';";
            Query.replace("password", Hashed);
            Query.replace("studentId", StudentNumber);

           const QJsonDocument& result1 = m_Database->Query(Query);
           qDebug() << result1;

//           RetrieveWeekServings();

//           setLoading(false);
        });
    }
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
    return "bajo jajo bajo jajo";
}


bool Data::sendingSurvey() const
{
    return m_sendingSurvey;
}

void Data::setSendingSurvey(bool newSendingSurvey)
{
    if (m_sendingSurvey == newSendingSurvey)
        return;
    m_sendingSurvey = newSendingSurvey;
    emit sendingSurveyChanged();
}


