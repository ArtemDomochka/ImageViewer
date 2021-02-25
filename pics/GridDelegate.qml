import QtQuick 2.12

Component {
    Item {
        width: gridView.cellWidth
        height: gridView.cellHeight
        Column {
            anchors.fill: parent
            Image {
                source: portrait
                anchors.horizontalCenter: parent.horizontalCenter
                width: 0.98 * parent.width
                height: 0.98 * parent.height
            }
        }
    }
}



