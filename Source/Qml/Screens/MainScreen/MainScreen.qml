import QtQuick 2.15
import QtQuick.Shapes 1.6

Item
{
    id: root
    anchors.fill: parent

    Rectangle
    {
        anchors.fill: parent
        color: "red"
    }

    Shape
    {
        anchors.fill: parent

        ShapePath
        {
            fillGradient: LinearGradient
            {
                x1: root.width / 2
                y1: 0

                x2: (root.width * (-500)) / (1080)
                y2: (root.height * (1900)) / (2400)

                GradientStop { position: 0; color: "#00A4A4" }
                GradientStop { position: 1; color: "#C8FFFF" }
            }
            PathLine { x: 0; y: 0 }
            PathLine { x: root.width; y: 0 }
            PathLine { x: root.width; y: root.height }
            PathLine { x: 0; y: root.height }
        }
    }
//    NavBar
//    {
//        anchors.bottom: root.bottom

//        onNavButtonClicked: function(buttonClicked)
//        {
//            switch(buttonClicked)
//            {
//            case "Home":
//                console.log("Home")
//                break;

//            case "Profile":
//                console.log("Profile")
//                break;

//            case "Scan":
//                console.log("Scan")
//                break;

//            case "FoodMenu":
//                console.log("FoodMenu")
//                break;

//            case "Survey":
//                console.log("Survey")
//                break;
//            }
//        }
//    }
}
