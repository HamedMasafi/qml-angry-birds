import QtQuick
import QtQuick.Controls
// import QtQuick.Extras
import QtQuick.Layouts
// import QtQuick.Controls.Styles
import Box2D

Rectangle {
    id: root
    width: layout.width
    height: layout.height
    border.color: "#00000000"
    property Entity target
    visible: target != null

    onTargetChanged: {
        if(target === null)
            return;

        root.x = target.x
        root.y = target.y - root.height
        checkBoxIsActive.checked = (target.body.bodyType === Body.Dynamic)
        spinAngle.value = target.rotation
        spinDamage.value = target.damage
    }

    RowLayout{
        id: layout
        Rectangle {
            Layout.fillHeight: true
            width: 20
            color: "#bebebe"

            Drag.active: dragArea.drag.active
            Drag.hotSpot.x: 10
            Drag.hotSpot.y: 10

            MouseArea {
                id: dragArea
                anchors.fill: parent
                drag.target: root

                onPositionChanged: {
                    target.x = root.x
                    target.y = root.y + root.height
                }
            }
        }
        CheckBox {
            id: checkBoxIsActive
            text: qsTr("Active")
            onCheckedChanged: target.body.bodyType = checked ? Body.Dynamic : Body.Static
        }
        Label{
            text: qsTr("Angle:")
        }
        SpinBox{
            id: spinAngle
            from: 0
            to: 359
            onValueChanged: {
                if(target !== null)
                    target.rotation = value
            }
        }

        Label{
            text: qsTr("Damage:")
        }
        SpinBox{
            id: spinDamage
            from: 1
            to: 300
            onValueChanged: {
                if(target !== null)
                    target.damage = value
            }
        }
        Button{
            text: "Remove"
            onClicked: {
                target.destroy()
                target = null;
            }
        }
    }
}
