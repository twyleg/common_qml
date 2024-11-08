// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Item {

    id: appView

    default property alias data: content.data

    signal closeViewRequested(view: SidebarAppView)

    NavigationSidebar {
        id: navigationSidebar

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    Item {
        id: content

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: navigationSidebar.right
        anchors.right: parent.right


    }

    function activateView(view) {
        for (var i=0; i<content.data.length; i++) {
            content.data[i].visible = content.data[i] === view
        }

        for (var i=0; i<navigationSidebar.topColumn.data.length; i++) {
            var elem = navigationSidebar.topColumn.data[i]
            if (elem instanceof NavigationSidebarButton) {
                elem.active = elem.view === view
            }
        }

        for (var i=0; i<navigationSidebar.bottomColumn.data.length; i++) {
            var elem = navigationSidebar.bottomColumn.data[i]
            if (elem instanceof NavigationSidebarButton) {
                elem.active = elem.view === view
            }
        }
    }


    function addButton(view, column) {

        console.log("Add button")

        var buttonComponent = Qt.createComponent("NavigationSidebarButton.qml");
        var button = buttonComponent.createObject(column, {"view": view})

        button.onClicked.connect(function (){
            activateView(view)
        });

        button.onCloseRequest.connect(function () {
            closeProjectViewRequested(view)
            view.destroy()
            button.destroy()
        })
    }


    function addTopButton(view) {
        addButton(view, navigationSidebar.topColumn)
    }

    function addBottomButton(view) {
        addButton(view, navigationSidebar.bottomColumn)
    }

    Component.onCompleted: {

        for (var i=0; i<content.data.length; i++) {
            var view = content.data[i]
            if (view.viewProperties.alignment === SidebarAppView.Alignment.Top) {
                addTopButton(view)
            } else {
                addBottomButton(view)
            }
        }
    }

}
