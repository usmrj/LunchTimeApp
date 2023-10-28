#ifndef DATETIME_H
#define DATETIME_H

#include <QObject>
#include <QQmlEngine>

class DateTime : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(QString CurrentTime READ CurrentTime WRITE setCurrentTime NOTIFY CurrentTimeChanged FINAL)
    Q_PROPERTY(QString CurrentDate READ CurrentDate WRITE setCurrentDate NOTIFY CurrentDateChanged FINAL)

public:

    explicit DateTime(QObject *parent = nullptr);
    ~DateTime();

signals:

    void CurrentTimeChanged();
    void CurrentDateChanged();

private:
    QString m_CurrentTime;
    QString m_CurrentDate;

public:

    QString CurrentTime() const;
    void setCurrentTime(const QString &newCurrentTime);

    QString CurrentDate() const;
    void setCurrentDate(const QString &newCurrentDate);

private slots:

    void UpdateDateTime();

private:

    void FormatDate(QString& OutDate);

private:

    class QTimer* RefreshDateTimer;
};

#endif // DATETIME_H
