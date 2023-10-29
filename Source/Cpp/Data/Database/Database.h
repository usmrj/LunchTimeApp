#ifndef DATABASE_H
#define DATABASE_H

#include <QString>
#include <QWeakPointer>
#include <QFuture>

class Database
{
public:
    Database();

public:

    class QJsonDocument Query(const QString& InQuery);
    void QueryNoRet(const QString& InQuery);

    static QWeakPointer<class QSqlDatabase> DatabaseConnection;

public:

    static void Connect();

};

#endif // DATABASE_H
