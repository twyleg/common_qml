// Copyright (C) 2024 twyleg
#include <QApplication>
#include <QObject>
#include <QQmlApplicationEngine>

#include <iostream>
#include <filesystem>


int main(int argc, char* argv[]) {

	auto common_qml_import_path = std::filesystem::current_path() / "external/common_qml/common_qml/qml";

	if(!std::filesystem::exists(common_qml_import_path)){
		std::cerr << "QML import path of \"common_qml\" not existing: " << common_qml_import_path << std::endl;
		return 1;
	}

	QApplication application(argc, argv);
	QQmlApplicationEngine engine;

	engine.addImportPath(common_qml_import_path.c_str());
	engine.load(":/frontend/qml/frontend.qml");

	return application.exec();;
}
