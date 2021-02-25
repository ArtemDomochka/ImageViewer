import QtQuick.Layouts 1.12
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import Qt.labs.folderlistmodel 2.1
import Qt.labs.platform 1.0

ApplicationWindow {
    width: 615
    height: 630
    minimumWidth: 180

    visible: true
    title: qsTr("Image Viewer")

    FolderListModel {
        id: folderModel
        nameFilters: ["*.jpeg", "*jpg", "*.png"]
        showDirs: false
        folder: ""
    }

    FolderDialog {
        id: folderDialog
        onFolderChanged: folderModel.folder = folder
    }

    Rectangle{
        id: menuBar
        z: 2
        width: parent.width
        height: 30
        color: "steelBlue"

        Button {
            id: selectFolder
            width: 60
            height: parent.height
            anchors.left: parent.left
            anchors.top: parent.top

            background: Rectangle{
                color: "darkgoldenrod"
                radius: 4
                anchors.fill: parent
            }

            Text {
                id: name
                text: qsTr("Open")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            onClicked: folderDialog.open()
        }

        Rectangle {
           id: inGrid
           width: 40
           height: parent.height
           color: "darkorange"
           anchors.right: parent.right

           MouseArea {
             anchors.fill: parent
             onClicked:  if(stackLayout.currentIndex !== 0) stackLayout.currentIndex = 0
           }
         }

        Rectangle {
           id: inList
           width: 40
           height: parent.height
           color: "darkorchid"
           anchors.right: inGrid.left

           MouseArea {
             anchors.fill: parent
             onClicked:  if(stackLayout.currentIndex !== 1) stackLayout.currentIndex = 1
           }
         }

        Rectangle {
           id: inPath
           width: 40
           height: parent.height
           color: "forestgreen"
           anchors.right: inList.left

           MouseArea {
             anchors.fill: parent
             onClicked:  if(stackLayout.currentIndex !== 2) stackLayout.currentIndex = 2
           }
         }

    }

    Rectangle{
        id: contentBoard
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height - menuBar.height
        color: "white"

        StackLayout{
            id: stackLayout
            anchors.fill: parent
            currentIndex: 1

            GridView {
                id: gridView
                Layout.fillWidth: parent
                Layout.fillHeight: parent
                cellWidth: 0.25 * (parent.width -15)
                cellHeight: cellWidth

                model: folderModel
                delegate: Component{
                    Item {
                    width: gridView.cellWidth
                    height: gridView.cellHeight
                    Column {
                        anchors.fill: parent
                        Image {
                            id: picture
                            source: folderModel.folder + "/" + fileName
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 0.98 * parent.width
                            height: 0.98 * parent.height

                            MouseArea{
                                anchors.fill: parent
                                onClicked:{
                                    iconView.visible = true
                                    iconImage.source = folderModel.folder + "/" + fileName
                                }
                            }
                        }
                    }
                    }
                }

               ScrollBar.vertical: ScrollBar{
                    id: scrollBarGrid
                    width: 15
                    active: true
                    contentItem: Rectangle{
                        color: "khaki"
                        radius: 5
                    }

                    anchors.right: gridView.right
                    background: Rectangle{
                        color: "steelblue"
                        radius: 3
                    }
                }

            }

            ListView {
                id: listView
                Layout.fillWidth: parent
                Layout.fillHeight: parent
                spacing: 3

                model: folderModel
                delegate: Component {
                    Item {
                        height: listView.height <= listView.width - 15 ? listView.height : listView.width - 15
                        width: listView.width - 15

                        Image {
                            id: image
                            source: folderModel.folder + "/" + fileName
                            height: parent.height
                            width: height
                            anchors.centerIn: parent
                        }

                    }
                }

                ScrollBar.vertical: ScrollBar{
                     id: scrollBarList
                     width: 15
                     active: true
                     contentItem: Rectangle{
                         color: "khaki"
                         radius: 5
                     }

                     anchors.right: parent.right
                     background: Rectangle{
                         color: "steelblue"
                         radius: 3
                     }
                 }

            }


            PathView {
                id: pathView
                Layout.fillWidth: parent
                Layout.fillHeight: parent
                model: folderModel

                delegate: Rectangle {
                    id: item
                    height: pathView.height <= pathView.width ? pathView.height * 0.25 : pathView.width * 0.25
                    width: height

                    border.width: 3
                    border.color: "#2f2f2f"

                    scale: PathView.itemscale

                    Image {
                                    anchors.fill: parent
                                    source: folderModel.folder + "/" + fileName

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked:{
                                            iconView.visible = true
                                            iconImage.source = folderModel.folder + "/" + fileName
                                        }
                                    }
                                }

                }

                interactive: true

                pathItemCount: 3
                preferredHighlightEnd: 0.5
                preferredHighlightBegin: 0.5

                path: Path {
                    startX: 0
                    startY: pathView.height * 0.5

                    PathAttribute { name: "itemscale"; value: 1 }

                    PathLine {
                        x: pathView.width * 0.5
                        y: pathView.height * 0.5
                    }

                    PathAttribute { name: "itemscale"; value: 1.3 }

                    PathLine {
                        x: pathView.width
                        y: pathView.height * 0.5
                    }

                    PathAttribute { name: "itemscale"; value: 1 }
                }

            }


        }


        Rectangle{
            id: iconView
            visible: false
            height: parent.height
            width: parent.width //- 15
            anchors.top: parent.top
            anchors.left: parent.left

            MouseArea{
                anchors.fill: parent
                onClicked: parent.visible = false
            }

            Image {
                id: iconImage
                height: parent.height <= parent.width ? parent.height : parent.width
                width: height
                source: ""
                anchors.centerIn: parent
            }
        }


    }

}
