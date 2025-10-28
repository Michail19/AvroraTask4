import QtQuick 2.0
import Sailfish.Silica 1.0
import com.example 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    StringListManager {
        id: stringManager
    }

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("StringListManager")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

    Column {
        width: parent.width - 2 * Theme.horizontalPageMargin
        anchors.centerIn: parent
        spacing: Theme.paddingLarge

        TextField {
            id: inputField
            width: parent.width
            placeholderText: "Введите слово"
            label: "Новое слово"
            EnterKey.iconSource: "image://theme/icon-m-enter-accept"
            EnterKey.onClicked: {
                if (text.trim().length > 0) {
                    stringManager.addString(text)
                    text = ""
                }
            }
        }

        Row {
            width: parent.width
            spacing: Theme.paddingMedium

            Button {
                width: (parent.width - parent.spacing) / 2
                text: "Добавить"
                enabled: inputField.text.trim().length > 0
                onClicked: {
                    stringManager.addString(inputField.text)
                    inputField.text = ""
                }
            }

            Button {
                width: (parent.width - parent.spacing) / 2
                text: "Удалить последнее"
                onClicked: stringManager.removeLastString()
            }
        }

        Rectangle {
            width: parent.width
            height: 1
            color: Theme.secondaryColor
            opacity: 0.5
        }

        Column {
            width: parent.width
            spacing: Theme.paddingSmall

            Label {
                width: parent.width
                text: "Список слов:"
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.secondaryColor
            }

            Rectangle {
                width: parent.width
                height: formattedText.height + 2 * Theme.paddingMedium
                color: Theme.rgba(Theme.highlightBackgroundColor, 0.1)
                radius: Theme.paddingSmall

                Label {
                    id: formattedText
                    width: parent.width - 2 * Theme.paddingMedium
                    anchors.centerIn: parent
                    text: stringManager.formattedList || "Список пуст"
                    wrapMode: Text.Wrap
                    font.pixelSize: Theme.fontSizeMedium
                    color: stringManager.formattedList ? Theme.primaryColor : Theme.secondaryColor
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Label {
                width: parent.width
                text: "Всего слов: " + (stringManager.formattedList ? stringManager.formattedList.split(", ").length : 0)
                font.pixelSize: Theme.fontSizeExtraSmall
                color: Theme.secondaryColor
                horizontalAlignment: Text.AlignLeft
            }
        }
    }
}
