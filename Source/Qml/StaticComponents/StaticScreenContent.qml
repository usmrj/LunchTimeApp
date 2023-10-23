import QtQuick 2.15
import "../Screens/QRscreen"

Item
{
    property var swipeView
    id: root

    function changeContentText(index)
    {
        navBar.screenChanged(index)
        switch(index)
        {
        case 0:
            topBar.changeScreenContentText("")          
            break;

        case 1:
            topBar.changeScreenContentText("Jadłospis")
            break;

        case 2:
            topBar.changeScreenContentText("Zagłosuj")
            break;

        case 3:
            topBar.changeScreenContentText("Profil")
            break;
        }
    }

    anchors.fill: parent

    TopBar
    {
        id: topBar
        anchors.top: parent.top
    }

    ScanScreen
    {
        id: scanScreen
        y: root.height

        PropertyAnimation
        {
            target: scanScreen
            id: scanSwipeAnimation
            property: "y"
            from: scanScreen.y
            to: scanScreen.y === root.height ? root.height - scanScreen.height : root.height
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }

    NavBar
    {
        id: navBar
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
