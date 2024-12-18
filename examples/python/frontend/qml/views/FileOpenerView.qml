// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import CommonQml.SidebarApp 0.1
import CommonQml.Icons 0.1
import CommonQml.Items 0.1

SidebarAppView {
    id: fileOpenerView

    viewProperties.name: "File Opener"
    viewProperties.iconUrl: IconLoader.getIconPath("material/radio_button_checked")

    ColumnLayout {

        spacing: 4
        anchors.fill: parent

        anchors.margins: 10

        FileFolderSelector {
            id: fileSelector

            text: "Example file"
            type: FileFolderSelector.Type.File
            nameFilters: ["Textfile (*.txt)"]

            Layout.fillWidth: true
            Layout.fillHeight: false

            headlineTextItem.Layout.preferredWidth: 120
            headlineTextItem.horizontalAlignment: Text.AlignRight

        }

        FileFolderSelector {
            id: folderSelector

            text: "Example folder"
            type: FileFolderSelector.Type.Folder

            Layout.fillWidth: true
            Layout.fillHeight: false

            headlineTextItem.Layout.preferredWidth: 120
            headlineTextItem.horizontalAlignment: Text.AlignRight

        }

        Item {
            Layout.fillHeight: true
        }
    }
}
