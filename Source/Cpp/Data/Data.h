#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QQmlEngine>
#include <QString>

class Data : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(bool loading READ loading WRITE setLoading NOTIFY loadingChanged FINAL)

public:
    explicit Data(QObject *parent = nullptr);
    ~Data();

signals:

    void loadingChanged();

private:

    class Database* m_Database;

    bool m_loading;

public:

    bool loading() const;
    void setLoading(bool newLoading);
};

#endif // DATA_H
