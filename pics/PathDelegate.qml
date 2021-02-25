import QtQuick 2.12

Component {
    Column {
        id: wrapper
        opacity: pathView.isCurrentItem ? 1 : 0.5
        Image {
            anchors.horizontalCenter: nameText.horizontalCenter
            width: 100; height: 100
            source: portrait
        }
        Text {
            id: nameText
            text: name
            font.pointSize: 10
        }
    }
}
