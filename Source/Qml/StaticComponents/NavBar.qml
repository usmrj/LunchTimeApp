import QtQuick 2.15
import QtQuick.Shapes 1.6
import QtQuick.Effects

Item
{
    id: root
    width: parent.width
    height: (parent.height * 229) / 2400

    property string strokeColor: "#FF8A00"
    property Image selectedButton: homeButton

    function screenChanged(index)
    {
        switch (index)
        {
        case 0:
            selectedButton = homeButton
            break;

        case 1:
            selectedButton = foodMenuButton
            break;

        case 2:
            selectedButton = surveyButton
            break;

        case 3:
            selectedButton = profileButton
            break;
        }
    }

    signal navButtonClicked(var outButtonClicked)

    Rectangle
    {
        id: barRoundness
        height: root.height
        width: height
        radius: height / 2
        color: "#444444"
        anchors
        {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle
    {
        id: bar
        width: parent.width
        height: (root.parent.height * 164) / 2400
        anchors.bottom: parent.bottom

        color: "#444444"
    }

//    layer.enabled: true
//    layer.effect: MultiEffect
//    {
//        shadowColor: "black"
//        shadowVerticalOffset: -1
//        shadowOpacity: 1
//        shadowEnabled: true
//        blurMultiplier: 1
//    }

    Rectangle
    {
        width: (root.width * 177) / (1080)
        height: width
        radius: width / 2
        anchors.centerIn: barRoundness

        color: "green"

        Image
        {

            source: `data:image/svg+xml, <svg width='79' height='79' viewBox='0 0 79 79' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M23.9492 75.3316H10.3397C7.02598 75.3316 4.33969 72.6453 4.33969 69.3316V55.0459' stroke='black' stroke-width='7' stroke-miterlimit='4.0688' stroke-linecap='round'/><path d='M4.00237 23.9414V10.3319C4.00237 7.01817 6.68866 4.33188 10.0024 4.33188H24.2881' stroke='black' stroke-width='7' stroke-miterlimit='4.0688' stroke-linecap='round'/><path d='M55.3926 3.99359H69.0021C72.3158 3.99359 75.0021 6.67988 75.0021 9.99358V24.2793' stroke='black' stroke-width='7' stroke-miterlimit='4.0688' stroke-linecap='round'/><path d='M74.6636 55.3838V68.9933C74.6636 72.307 71.9774 74.9933 68.6636 74.9933H54.3779' stroke='black' stroke-width='7' stroke-miterlimit='4.0688' stroke-linecap='round'/><rect x='22.502' y='22.4932' width='35' height='35' rx='10.5' stroke='black' stroke-width='7'/></svg>`
            anchors.centerIn: parent
            height: (root.width * (sourceSize.height)) / (1080)
            width: (root.width * (sourceSize.width)) / (1080)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("Scan")
                }
            }
        }
    }

    Row
    {
        spacing: (root.width * (94)) / (1080)
        anchors
        {
            left: bar.left
            leftMargin: spacing
            verticalCenter: bar.verticalCenter
        }

        Image
        {
            id: homeButton
            source: selectedButton === homeButton ? `data:image/svg+xml, <svg width='${width}' height='${height}' viewBox='0 0 82 87' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M29.3158 82.999H11C7.13401 82.999 4 79.865 4 75.999V34.6846C4 30.4441 6.06813 26.4702 9.54113 24.0372L35.2624 6.01844C38.7069 3.60542 43.2931 3.60543 46.7376 6.01844L72.4589 24.0372C75.9319 26.4702 78 30.4441 78 34.6845V75.999C78 79.865 74.866 82.999 71 82.999H52.6842M29.3158 82.999V57.543C29.3158 54.7816 31.5544 52.543 34.3158 52.543H47.6842C50.4456 52.543 52.6842 54.7816 52.6842 57.543V82.999M29.3158 82.999H52.6842' stroke='${strokeColor}' stroke-width='7'/></svg>` : `data:image/svg+xml, <svg width='82' height='87' viewBox='0 0 82 87' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M29.3158 82.999H11C7.13401 82.999 4 79.865 4 75.999V34.6846C4 30.4441 6.06813 26.4702 9.54113 24.0372L35.2624 6.01844C38.7069 3.60542 43.2931 3.60543 46.7376 6.01844L72.4589 24.0372C75.9319 26.4702 78 30.4441 78 34.6845V75.999C78 79.865 74.866 82.999 71 82.999H52.6842M29.3158 82.999V57.543C29.3158 54.7816 31.5544 52.543 34.3158 52.543H47.6842C50.4456 52.543 52.6842 54.7816 52.6842 57.543V82.999M29.3158 82.999H52.6842' stroke='black' stroke-width='7'/></svg>`
            height: 87 / 4//sourceSize.height / 4// * (Math.min(root.parent.height, root.parent.width / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.height / 4)
            width: 82 / 4//sourceSize.width / 4// * (Math.min(root.parent.width, root.parent.height / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.width / 4)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("Home")
                }
            }
        }

        Image
        {
            id: foodMenuButton
            source: selectedButton === foodMenuButton ? `data:image/svg+xml, <svg width='80' height='85' viewBox='0 0 80 85' fill='none' xmlns='http://www.w3.org/2000/svg'><rect x='3.50098' y='3.49316' width='73' height='78' rx='16.5' stroke='${strokeColor}' stroke-width='7'/><path d='M24.2375 61.888L28.5061 28.6408C28.7968 26.3767 30.6147 24.6506 32.9101 24.4593L35.8413 24.215C44.7152 23.4753 53.3327 28.1284 57.6757 36.0046L58.2057 36.9657C59.4349 39.195 58.829 41.9317 56.7916 43.3529L27.4185 63.8421C25.9968 64.8338 24.0156 63.6167 24.2375 61.888Z' stroke='${strokeColor}' stroke-width='5'/><circle cx='36.001' cy='46.9932' r='4' fill='${strokeColor}'/><circle cx='47.001' cy='39.9932' r='4' fill='${strokeColor}'/><circle cx='36.001' cy='34.9932' r='4' fill='${strokeColor}'/></svg>` : `data:image/svg+xml, <svg width='80' height='85' viewBox='0 0 80 85' fill='none' xmlns='http://www.w3.org/2000/svg'><rect x='3.50098' y='3.49316' width='73' height='78' rx='16.5' stroke='black' stroke-width='7'/><path d='M24.2375 61.888L28.5061 28.6408C28.7968 26.3767 30.6147 24.6506 32.9101 24.4593L35.8413 24.215C44.7152 23.4753 53.3327 28.1284 57.6757 36.0046L58.2057 36.9657C59.4349 39.195 58.829 41.9317 56.7916 43.3529L27.4185 63.8421C25.9968 64.8338 24.0156 63.6167 24.2375 61.888Z' stroke='black' stroke-width='5'/><circle cx='36.001' cy='46.9932' r='4' fill='black'/><circle cx='47.001' cy='39.9932' r='4' fill='black'/><circle cx='36.001' cy='34.9932' r='4' fill='black'/></svg>`
            height: sourceSize.height / 4// * (Math.min(root.parent.height, root.parent.width / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.height / 4)
            width: sourceSize.width / 4// * (Math.min(root.parent.width, root.parent.height / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.width / 4)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("FoodMenu")
                }
            }
        }
    }


    Row
    {
        spacing: (root.width * (94)) / (1080)
        anchors
        {
            right: bar.right
            rightMargin: spacing
            verticalCenter: bar.verticalCenter
        }

        Image
        {
            id: surveyButton
            source: selectedButton === surveyButton ? `data:image/svg+xml, <svg width='83' height='83' viewBox='0 0 83 83' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M25.0024 43.6812L35.609 54.2878L59.297 30.5998' stroke='${strokeColor}' stroke-width='6'/><rect x='3.50195' y='3.49316' width='76' height='76' rx='19.5' stroke='${strokeColor}' stroke-width='7'/></svg>` : `data:image/svg+xml, <svg width='83' height='83' viewBox='0 0 83 83' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M25.0024 43.6812L35.609 54.2878L59.297 30.5998' stroke='black' stroke-width='6'/><rect x='3.50195' y='3.49316' width='76' height='76' rx='19.5' stroke='black' stroke-width='7'/></svg>`
            height: sourceSize.height / 4// * (Math.min(root.parent.height, root.parent.width / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.height / 4)
            width: sourceSize.width / 4// * (Math.min(root.parent.width, root.parent.height / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.width / 4)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("Survey")
                }
            }
        }

        Image
        {
            id: profileButton
            source: selectedButton === profileButton ? `data:image/svg+xml, <svg width='82' height='77' viewBox='0 0 82 77' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M56.7642 43.9922H24.7397C18.7582 43.9922 13.2762 47.3286 10.5282 52.6414L7.55069 58.398C4.10787 65.0541 8.93908 72.9922 16.4329 72.9922H65.071C72.5648 72.9922 77.396 65.0541 73.9532 58.398L70.9757 52.6414C68.2277 47.3286 62.7457 43.9922 56.7642 43.9922Z' stroke='${strokeColor}' stroke-width='7'/><circle cx='40.502' cy='17.4922' r='14' stroke='${strokeColor}' stroke-width='7'/></svg>` : `data:image/svg+xml, <svg width='82' height='77' viewBox='0 0 82 77' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M56.7642 43.9922H24.7397C18.7582 43.9922 13.2762 47.3286 10.5282 52.6414L7.55069 58.398C4.10787 65.0541 8.93908 72.9922 16.4329 72.9922H65.071C72.5648 72.9922 77.396 65.0541 73.9532 58.398L70.9757 52.6414C68.2277 47.3286 62.7457 43.9922 56.7642 43.9922Z' stroke='black' stroke-width='7'/><circle cx='40.502' cy='17.4922' r='14' stroke='black' stroke-width='7'/></svg>`
            height: sourceSize.height / 4 //* (Math.min(root.parent.height, root.parent.width / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.height / 4)
            width: sourceSize.width / 4 //* (Math.min(root.parent.width, root.parent.height / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.width / 4)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("Profile")
                }
            }
        }
    }
}

