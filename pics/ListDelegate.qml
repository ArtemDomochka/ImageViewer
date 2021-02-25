import QtQuick 2.12

Component {
    Item {
        width: listView.width
        height: 120
        Column {
            Image { source: portrait}
            Text { text: name}
        }
    }
}
