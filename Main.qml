import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15

import "Source/Qml/Screens/MainScreen"
import "Source/Qml/Screens/FoodMenuScreen"
import "Source/Qml/Screens/ProfileScreen"
import "Source/Qml/Screens/QRscreen"
import "Source/Qml/Screens/SurveyScreen"

Window
{
    readonly property real screenX: 1080 / 4
    readonly property real screenY: 2400 / 4

    width: screenX
    height: screenY
    visible: true
    title: qsTr("Hello World")

    id: window





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
    }


    ScanScreen
    {
        id: scanScreen
        y: window.height

        PropertyAnimation
        {
            target: scanScreen
            id: scanSwipeAnimation
            property: "y"
            from: scanScreen.y
            to: scanScreen.y === window.height ? window.height - scanScreen.height : window.height
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }

    NavBar
    {
        anchors.bottom: parent.bottom

        onNavButtonClicked: function(buttonClicked)
        {
            switch(buttonClicked)
            {
            case "Home":
                if(swipeView.currentIndex === 1)
                    swipeView.currentIndex--
                else
                    swipeView.currentIndex = 0
                break;


            case "FoodMenu":
                if(swipeView.currentIndex === 0)
                    swipeView.currentIndex++
                else if(swipeView.currentIndex === 2)
                    swipeView.currentIndex--
                else
                    swipeView.currentIndex = 1
                break;

            case "Survey":
                if(swipeView.currentIndex === 1)
                    swipeView.currentIndex++
                else if(swipeView.currentIndex === 3)
                    swipeView.currentIndex--
                else
                    swipeView.currentIndex = 2
                break;


            case "Profile":
                if(swipeView.currentIndex === 2)
                    swipeView.currentIndex++
                else
                    swipeView.currentIndex = 3
                break;


            case "Scan":
                scanSwipeAnimation.start()
                break;


            default:
                break;
            }
        }
    }
}
