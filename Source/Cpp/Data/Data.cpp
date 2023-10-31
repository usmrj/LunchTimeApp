#include "Data.h"
#include "Source/Cpp/Data/Database/Database.h"
#include <QCryptographicHash>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonArray>
#include "Source/Cpp/Data/Time/DateTime.h"

#include <QDebug>

Data::Data(QObject *parent)
    : QObject{parent}
    , m_Database{new Database}
    , m_loading{true}
    , m_sendingSurvey{false}
    , m_login{false}
    , m_error{false}
{
    if(m_Database)
    {
        checkConnection();
        //        m_Database->Query("SELECT * FROM Dishes");

        //        QMap<QString, QString> test =
        //        {
        //            {"studentId", "1"},
        //            {"password", "password1"}
        //        };

        ////        m_Database->Post("auth", test);
        ////        qDebug() << "ddddddddddddddddddddddddddddddddddd";
        ////        m_Database->Get("dishes");
        ////        qDebug() << "ddddddddddddddddddddddddddddddddddd";
        ////         m_Database->Post("auth", test);
        ////        qDebug() << "ddddddddddddddddddddddddddddddddddd";
        ////          m_Database->Get("dishes");
        ////        m_Database->Get("dishes");
        ////          m_Database->Get("dishes");
        ////        m_Database->Get("dishes");
        ////          m_Database->Get("dishes");
        //        m_Database->Post("auth", test);

    }
    //    if(m_Database != nullptr)
    //    {
    //        QFuture<void> future = QtConcurrent::run(m_Database->Connect).then([this]()
    //        {
    //            const QJsonDocument& result1 = m_Database->Query("SELECT * FROM Dishes");
    //            //qDebug() << result1;

    //            RetrieveWeekServings();

    //            setLoading(false);
    //        });
    //    }

    //WeekDishes.insert(1, {"Zupa", "Schabowy", "Ziem", "Kap"});
}

Data::~Data()
{
    delete m_Database;
}

void Data::OnLoggedIn()
{
    RetrieveWeekServings();
}

void Data::RetrieveWeekServings()
{
    std::function<void(QNetworkReply*)> callbackFunction = std::bind(&Data::WeekServingsReply, this, std::placeholders::_1);
    RequestConnections.insert("RetrieveWeekServings", m_Database->ConnectCallbackFunction(callbackFunction));

    QMap<QString, QString> Data =
    {
        {"schoolId", QString::number(LoginData.SchoolId)}
    };

    m_Database->Post("week", Data);
}

void Data::WeekServingsReply(QNetworkReply *Reply)
{
    if(Reply != nullptr)
    {
        if (Reply->error() == QNetworkReply::NoError)
        {
            QByteArray responseData = Reply->readAll();

            QJsonDocument jsonDocument = QJsonDocument::fromJson(responseData);
            if (!jsonDocument.isNull())
            {
                for(int i = 0; i < jsonDocument.array().count(); i++)
                {
                    const auto& Data = jsonDocument[i];
                    WeekDishes.insert(i + 1, {Data["DishId"].toInt(), Data["DishName"].toString(), Data["DishName"].toString(), Data["DishIngr1"].toString(), Data["DishIngr2"].toString()});
                    //                    qDebug() << Data["DishId"].toInt() << " "
                    //                             << Data["DishName"].toString() << " "
                    //                             << Data["DishIngr1"].toString() << " "
                    //                             << Data["DishIngr2"].toString() << " "
                    //                             << Data["DishIngr3"].toString() << " "
                    //                             << Data["DishIngr4"].toString() << " "
                    //                             << Data["DishIngr5"].toString() << " "
                    //                             << Data["IsSecond"].toString();
                }
            }
            emit menuUpdated();
            emit loggedIn();
        }
        else
        {
            qDebug() << "Error: " << Reply->errorString();
        }

        Reply->deleteLater();

        m_Database->DisconnectCallbackFunction(RequestConnections["RetrieveWeekServings"]);
        RequestConnections.remove("RetrieveWeekServings");

        RetrieveSurveyData();
    }
}

void Data::RetrieveSurveyData()
{
    std::function<void(QNetworkReply*)> callbackFunction = std::bind(&Data::SurveyDataReply, this, std::placeholders::_1);
    RequestConnections.insert("RetrieveSurveyData", m_Database->ConnectCallbackFunction(callbackFunction));

    QMap<QString, QString> Data =
    {
        {"studentId", QString::number(LoginData.StudentId)}
    };

    m_Database->Post("surveyData", Data);
}

void Data::SurveyDataReply(QNetworkReply *Reply)
{
    if(Reply != nullptr)
    {
        if (Reply->error() == QNetworkReply::NoError)
        {
            QByteArray responseData = Reply->readAll();

            QJsonDocument jsonDocument = QJsonDocument::fromJson(responseData);
            if (!jsonDocument.isNull())
            {
                if(jsonDocument.array().count() > 0)
                {
                    const auto& Data = jsonDocument[0];
                    int SurveyChoice = Data["feedback"].toInt();
                    emit surveyDataUpdated(SurveyChoice);
                }
                else
                {
                    emit surveyDataUpdated(0);
                }
            }
        }
        else
        {
            qDebug() << "Error: " << Reply->errorString();
        }

        Reply->deleteLater();

        m_Database->DisconnectCallbackFunction(RequestConnections["RetrieveSurveyData"]);
        RequestConnections.remove("RetrieveSurveyData");
    }
}

void Data::checkConnection()
{
    setError(false);
    std::function<void(QNetworkReply*)> callbackFunction = std::bind(&Data::CheckConnectionReply, this, std::placeholders::_1);
    RequestConnections.insert("CheckConnection", m_Database->ConnectCallbackFunction(callbackFunction));
    m_Database->Get("con");
}

void Data::CheckConnectionReply(QNetworkReply *Reply)
{
    if(Reply != nullptr)
    {
        if (Reply->error() == QNetworkReply::NoError)
        {
            QByteArray responseData = Reply->readAll();

            if(QString::fromUtf8(responseData).remove('"') == "authenticated")
            {
                setLoading(false);
                setLogin(true);
            }
            else
                setError(true);
        }
        else
        {
            setError(true);
            qDebug() << "Error: " << Reply->errorString();
        }

        Reply->deleteLater();

        m_Database->DisconnectCallbackFunction(RequestConnections["CheckConnection"]);
        RequestConnections.remove("CheckConnection");
    }
}

QString Data::getDish(int InDay, int Value) const
{
    switch(Value)
    {
    case 0:
        return QString::number(WeekDishes[InDay].DishId);
        break;

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
    QMap<QString, QString> Data =
    {
        {"choice", QString::number(Choice)},
        {"studentId", QString::number(LoginData.StudentId)},
        {"schoolId", QString::number(LoginData.SchoolId)},
        {"dishId", getDish(DateTime::getCurrentDay(), 0)}
    };

    m_Database->Post("survey", Data);
}

void Data::tryLogin(const QString &StudentNumber, const QString &Password)
{
    QByteArray passwordBytes = Password.toUtf8();
    QByteArray hashBytes = QCryptographicHash::hash(passwordBytes, QCryptographicHash::Blake2b_256);

    QMap<QString, QString> test =
    {
        {"studentId", StudentNumber},
        {"password", QString(hashBytes.toHex())}
    };

    std::function<void(QNetworkReply*)> callbackFunction = std::bind(&Data::TryLoginReply, this, std::placeholders::_1);
    RequestConnections.insert("TryLogin", m_Database->ConnectCallbackFunction(callbackFunction));

    m_Database->Post("auth", test);
    setLoading(true);
    setLogin(false);
}

void Data::TryLoginReply(QNetworkReply *Reply)
{
    setLoading(false);
    if(Reply != nullptr)
    {
        if (Reply->error() == QNetworkReply::NoError)
        {
            QByteArray responseData = Reply->readAll();

            QJsonDocument jsonDocument = QJsonDocument::fromJson(responseData);

            if (!jsonDocument.isNull())
            {
                if(jsonDocument.array().count() != 0)
                {
                    const auto& Data = jsonDocument[0];
                    LoginData.StudentId = Data["StudentId"].toInt();
                    LoginData.SchoolId = Data["SchoolId"].toInt();
                    LoginData.FirstName = Data["FirstName"].toString();

                    setLogin(false);
                    OnLoggedIn();
                }
                else
                {
                    setLogin(true);
                }
            }
        }
        else
        {
            qDebug() << "Error: " << Reply->errorString();
        }

        Reply->deleteLater();

        m_Database->DisconnectCallbackFunction(RequestConnections["TryLogin"]);
        RequestConnections.remove("TryLogin");
    }
}

QString Data::getQrContent() const
{
    return "bajo jajo bajo jajo";
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

bool Data::login() const
{
    return m_login;
}

void Data::setLogin(bool newLogin)
{
    if (m_login == newLogin)
        return;
    m_login = newLogin;
    emit loginChanged();
}

bool Data::error() const
{
    return m_error;
}

void Data::setError(bool newError)
{
    if (m_error == newError)
        return;
    m_error = newError;
    emit errorChanged();
}
