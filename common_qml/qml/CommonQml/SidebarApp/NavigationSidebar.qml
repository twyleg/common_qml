// Copyright (C) 2024 twyleg
import QtQuick 2.0
import QtQuick.Layouts 1.15

Rectangle {
    id: navigationSidebar

    width: 100
    color: "#FF404142"

    property alias topColumn: topColumn
    property alias bottomColumn: bottomColumn
    property int activeView: 1

    signal activateViewRequested(view: SidebarAppView)
    signal closeViewRequested(view: SidebarAppView)

    ColumnLayout {
        id: column

        anchors.fill: parent
        spacing: 0

        ColumnLayout {
            id: topColumn

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop

        }

        ColumnLayout {
            id: bottomColumn

            Layout.fillWidth: true
            Layout.fillHeight: false

            Layout.alignment: Qt.AlignBottom
        }
    }

    function addButton(view) {

        console.log("Add button")

        var column = view.viewProperties.alignment === SidebarAppView.Alignment.Top ? topColumn : bottomColumn

        var buttonComponent = Qt.createComponent("NavigationSidebarButton.qml");
        var button = buttonComponent.createObject(column, {"view": view})

        button.onClicked.connect(function (){
            // activateView(view)
            activateViewRequested(view)
        });

        button.onCloseRequest.connect(function () {
            closeViewRequested(view)
        })
    }

    function removeButton(view) {
        for (var i=0; i<topColumn.data.length; i++) {
            var elem = topColumn.data[i]
            if (elem instanceof NavigationSidebarButton) {
                if (elem.view === view) {
                    elem.destroy()
                }
            }
        }

        for (var i=0; i<bottomColumn.data.length; i++) {
            var elem = bottomColumn.data[i]
            if (elem instanceof NavigationSidebarButton) {
                if (elem.view === view) {
                    elem.destroy()
                }
            }
        }
    }

    function activateButton(view) {

        for (var i=0; i<topColumn.data.length; i++) {
            var elem = topColumn.data[i]
            if (elem instanceof NavigationSidebarButton) {
                elem.active = elem.view === view
            }
        }

        for (var i=0; i<bottomColumn.data.length; i++) {
            var elem = bottomColumn.data[i]
            if (elem instanceof NavigationSidebarButton) {
                elem.active = elem.view === view
            }
        }
    }


}
