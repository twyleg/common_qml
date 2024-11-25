# Copyright (C) 2024 twyleg
import sys
import argparse
import logging
from pathlib import Path
from simple_python_app_qt.qml_application import QmlApplication
from common_qml import COMMON_QML_IMPORT_PATH


FILE_DIR = Path(__file__).parent


class QmlApplicationCounterExample(QmlApplication):
    def __init__(self):
        # sys.argv += ["--style", "Material"]
        super().__init__(
            application_name="simple_counter_app_qml_example",
            version="0.0.1",
            application_config_init_enabled=False,
            logging_logfile_output_dir=FILE_DIR / "log/",
            logging_force_log_level=logging.DEBUG,
            frontend_qml_file_path=FILE_DIR / "frontend/qml/Frontend.qml",
        )

    def run(self, args: argparse.Namespace) -> int:
        self.engine.addImportPath(COMMON_QML_IMPORT_PATH)
        return self.open()


if __name__ == "__main__":
    qml_application_example = QmlApplicationCounterExample()
    qml_application_example.start()
