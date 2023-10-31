#include "Database.h"
#include "qjsondocument.h"
#include "qjsonobject.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QUrlQuery>


Database::Database(QObject *parent)
    : NetworkManager{new QNetworkAccessManager}
{

}

Database::~Database()
{

}

QMetaObject::Connection Database::ConnectCallbackFunction(std::function<void(QNetworkReply*)> Callback)
{
    return connect(NetworkManager, &QNetworkAccessManager::finished, Callback);
}

void Database::DisconnectCallbackFunction(QMetaObject::Connection connection)
{
    disconnect(connection);
}

void Database::Get(const QString& Action)
{
    //NetworkManager->get(QNetworkRequest(QUrl("http://localhost/index.php/" + Action)));
    NetworkManager->get(QNetworkRequest(QUrl("http://localhost:3000/api/" + Action)));
}

void Database::Post(const QString& Action, const QMap<QString, QString>& InputMap)
{
//    QUrl url("http://localhost/index.php/" + Action);

//    QUrlQuery postData;
//    for (const QString &Key : InputMap.keys())
//    {
//        postData.addQueryItem(Key, InputMap[Key]);
//    }

//    QByteArray postDataBytes = postData.toString(QUrl::FullyEncoded).toUtf8();

//    QNetworkRequest request(url);
//    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");

    QUrl url("http://localhost:3000/api/" + Action);

    QJsonDocument jsonData;
    QJsonObject jsonObject;

    for (const QString &Key : InputMap.keys())
    {
        jsonObject[Key] = InputMap[Key];
    }
    jsonData.setObject(jsonObject);

    QByteArray postDataBytes = jsonData.toJson(QJsonDocument::Compact);

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    NetworkManager->post(request, postDataBytes);
}


