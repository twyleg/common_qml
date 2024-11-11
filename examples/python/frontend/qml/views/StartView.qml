// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Controls 2.15

import CommonQml.SidebarApp 0.1
import CommonQml.SidebarApp.Views 0.1

BaseStartView {
    id: startView

    signal addViewRequested()

    Button {
        text: "Add view"
        onClicked: addViewRequested()

    }
}
