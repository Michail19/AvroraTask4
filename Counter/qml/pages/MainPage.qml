import QtQuick 2.0
import Sailfish.Silica 1.0
import com.example 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Counter")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

    Counter {
        id: counter
        value: 10
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            width: 100
            height: 40
            border.color: "gray"
            radius: 5

            Text {
                anchors.centerIn: parent
                text: counter.value
                font.pixelSize: 18
                color: "blue"
            }
        }

        Button {
            text: "Увеличить"
            onClicked: counter.increment()
        }

        Button {
            text: "Сбросить"
            onClicked: counter.reset()
        }
    }
}
