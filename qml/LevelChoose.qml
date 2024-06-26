import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import AngryBirds

Item {


    StackView.onStatusChanged: {
        listView.model = factory.levels()
    }

    Component.onCompleted: listView.model = factory.levels()

    LevelFactory{
        id: factory
    }


    RowLayout{
        width: 400
        height: 300
        anchors.centerIn: parent
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            Layout.preferredWidth: 10
            ColumnLayout{
                anchors.centerIn: parent
                Button{
                    text: qsTr("Create new...")
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push(Qt.resolvedUrl("CreateLevel.qml"))
                }
            }
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 10
            GroupBox {
                title: qsTr("Choose level")
                anchors.fill: parent
                ListView{
                    id: listView
                    anchors.fill: parent
                    clip: true

                    delegate: Text {
                        text: modelData
                        MouseArea{
                            anchors.fill: parent
                            onClicked: stackView.push(
                                           Qt.resolvedUrl("Play.qml"),
                                           {level: modelData}
                                           )
                        }
                    }
                }

            }

        }
    }
}
