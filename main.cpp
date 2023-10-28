#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QJsonDocument>
#include <QJsonArray>
#include <QDebug>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/HackHeroesProject/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);


    //Exaple usage/////////////////////////////////////////////

//    DatabaseConnection::SetDatabaseCredentials("lunchlidnkdb", "www.db4free.net", "@adSZKr2!PVFxK3" , "hitormissmedude");
//    const QJsonDocument& JsonQueryOutput = DatabaseConnection::Query("SELECT * FROM Dishes");

//    for(int i = 0; i < JsonQueryOutput.array().count(); i++)
//    {
//        const auto& Data = JsonQueryOutput[i];
//        qDebug() << Data["DishId"].toInt() << " "
//                 << Data["DishName"].toString() << " "
//                 << Data["DishIngr1"].toString() << " "
//                 << Data["DishIngr2"].toString() << " "
//                 << Data["DishIngr3"].toString() << " "
//                 << Data["DishIngr4"].toString() << " "
//                 << Data["DishIngr5"].toString() << " "
//                 << Data["IsSecond"].toString();
//    }

    /////////////////////////////////////////////////////

    return app.exec();
}
