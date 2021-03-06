// Copyright (c) 2015 Ultimaker B.V.
// Uranium is released under the terms of the AGPLv3 or higher.

import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import QtQuick.Controls.Styles 1.1

import UM 1.0 as UM

import ".."

PreferencesPage {
    //: Plugins configuration page
    title: qsTr("Plugins");
    contents: ScrollView 
    {
        anchors.fill: parent;
        ListView 
        {
            id:plugin_list
            delegate: pluginDelegate
            model: UM.Models.pluginsModel
            section.delegate: Label { text: section }
            section.property: "type"
        }
    }

    Component
    {
        id: pluginDelegate
        RowLayout 
        {
            width: ListView.view.width;
            CheckBox
            {
                text: model.name;
                x: 0
                Layout.minimumWidth: 50
                Layout.preferredWidth: 250
                checked: model.enabled
                onClicked: plugin_list.model.setEnabled(model.name, checked)
                enabled: !model.required 
            }
            Button
            {
                iconName: "help-about";

                onClicked:
                {
                    about_window.about_text = model.description
                    about_window.author_text = model.author
                    about_window.plugin_name = model.name
                    about_window.version_text = model.version
                    about_window.visibility = 1
                }
            }
        }
    }
    
    Dialog
    {
        id: about_window

        //: Default description for plugin
        property variant about_text: qsTr("No text available")

        property variant author_text: "John doe"
        property variant plugin_name: ""
        property variant version_text: ""

        //: About dialog with info about plugin %1
        title: qsTr("About %1").arg(plugin_name)

        width: Screen.devicePixelRatio * 320;
        height: Screen.devicePixelRatio * 240;

        GridLayout
        {
            anchors.fill: parent;
            columns: 2;
            Label
            {
                Layout.columnSpan: 2;
                text: about_window.plugin_name
                font.pointSize: 18
            }
            Label
            {
                Layout.columnSpan: 2;
                text: about_window.about_text
            }
            Label
            {
                //: About plugin dialog author label
                text: qsTr("Author:");
            }
            Label
            {
                text: about_window.author_text
            }
            Label
            {
                //: About plugin dialog version label
                text: qsTr("Version:");
            }
            Text
            {
                text: about_window.version_text
            }
        }

        rightButtons: Button {
            //: Close "about plugin" dialog button
            text: qsTr("Close");
            onClicked: about_window.visible = false;
        }
    }
}
