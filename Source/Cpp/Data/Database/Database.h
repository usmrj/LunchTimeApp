#ifndef DATABASE_H
#define DATABASE_H

#include <QString>
#include <QWeakPointer>
#include <QFuture>
#include <QObject>

enum DatabaseOperation
{
    TryLogin = 1,
    SendSurvey = 2
};

class Database : public QObject
{
    Q_OBJECT

public:

    explicit Database(QObject *parent = nullptr);
    ~Database();

public:

    class QNetworkAccessManager* NetworkManager;

public:

    void Get(const QString& Action);
    void Post(const QString& Action, const QMap<QString, QString>& InputMap);
    QMetaObject::Connection ConnectCallbackFunction(std::function<void(class QNetworkReply*)> Callback);
    void DisconnectCallbackFunction(class QMetaObject::Connection connection);

};

#endif // DATABASE_H
