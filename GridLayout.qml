import QtQuick 2.0

GridView {
    width: 300; height: 200

    model: ContactModel {}
    delegate: Column {
        Image { source: portrait; anchors.horizontalCenter: parent.horizontalCenter }
        Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
    }
}
