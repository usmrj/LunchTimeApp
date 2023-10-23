import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15

import "Source/Qml/Screens/MainScreen"
import "Source/Qml/Screens/FoodMenuScreen"
import "Source/Qml/Screens/ProfileScreen"
import "Source/Qml/Screens/QRscreen"
import "Source/Qml/Screens/SurveyScreen"
import "Source/Qml/StaticComponents"

Window
{
    readonly property real screenX: 1080 / 4
    readonly property real screenY: 2400 / 4

    width: screenX
    height: screenY
    visible: true
    title: qsTr("Hello World")

    id: window





    ScreenBackground
    {
        id: screenBackground
    }



    SwipeView
    {
        id: swipeView
        anchors.fill: parent

        Item
        {
            MainScreen
            {
                id: homeScreen
            }
        }
        Item
        {
            FoodMenuScreen
            {
                id: foodMenuScreen
            }
        }
        Item
        {
            SurveyScreen
            {
                id: surveyScreen
            }
        }
        Item
        {
            ProfileScreen
            {
                id: profileScreen
            }
        }

        onCurrentIndexChanged:
        {
            screenBackground.screenMoved(currentIndex)
            staticScreenContent.changeContentText(currentIndex)
        }
    }


    StaticScreenContent
    {
        id: staticScreenContent
        swipeView: swipeView
    }
}
