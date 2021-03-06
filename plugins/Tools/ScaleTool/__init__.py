# Copyright (c) 2015 Ultimaker B.V.
# Uranium is released under the terms of the AGPLv3 or higher.

from . import ScaleTool

from UM.i18n import i18nCatalog
i18n_catalog = i18nCatalog("uranium")

def getMetaData():
    return {
        "type": "tool",
        "plugin": {
            "name": "Scale Tool",
            "author": "Ultimaker",
            "version": "1.0",
            "description": i18n_catalog.i18nc("Scale Tool plugin description", "Provides the Scale tool.")
        },
        "tool": {
            "name": i18n_catalog.i18nc("Scale Tool name", "Scale"),
            "description": i18n_catalog.i18nc("Scale Tool description", "Scale Object"),
            "icon": "scale",
            "tool_panel": "ScaleTool.qml"
        }
    }

def register(app):
    return { "tool": ScaleTool.ScaleTool() }
