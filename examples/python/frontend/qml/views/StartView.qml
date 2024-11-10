// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Controls 2.15

import CommonQml.SidebarApp 0.1
import CommonQml.Icons 0.1

SidebarAppView {
    id: startView

    viewProperties.name: "Home"
    viewProperties.iconUrl: IconLoader.getIconPath("material/home")

    signal addViewRequested()

    Button {
        text: "Add view"
        onClicked: addViewRequested()

    }
}
