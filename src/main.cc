#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char * argv[]) {
  QApplication application(argc, argv);
  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/timer.qml")));
  return application.exec();
}

