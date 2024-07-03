import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

class FeedingPage extends StatefulWidget {
  const FeedingPage({Key? key}) : super(key: key);

  @override
  _FeedingPageState createState() => _FeedingPageState();
}

class _FeedingPageState extends State<FeedingPage> {
  final flutterReactiveBle = FlutterReactiveBle();
  DiscoveredDevice? targetDevice;
  QualifiedCharacteristic? characteristic;
  late Stream<ConnectionStateUpdate> connectionStream;

  @override
  void initState() {
    super.initState();
    checkPermissionsAndScan();
  }

  void checkPermissionsAndScan() async {
    if (await Permission.bluetooth.isGranted &&
        await Permission.location.isGranted) {
      scanForDevices();
    } else {
      await [Permission.bluetooth, Permission.location].request();
      if (await Permission.bluetooth.isGranted &&
          await Permission.location.isGranted) {
        scanForDevices();
      } else {
        // Permissões não concedidas
        print('Permissões de Bluetooth e/ou localização não concedidas.');
      }
    }
  }

  void scanForDevices() {
    flutterReactiveBle.scanForDevices(
      withServices: [],
      scanMode: ScanMode.lowLatency,
    ).listen((device) {
      print('Dispositivo encontrado: ${device.name}');
      if (device.name == "ESP32_BT") {
        setState(() {
          targetDevice = device;
        });
        connectToDevice();
      }
    });
  }

  void connectToDevice() {
    if (targetDevice == null) return;

    connectionStream = flutterReactiveBle.connectToAdvertisingDevice(
      id: targetDevice!.id,
      prescanDuration: const Duration(seconds: 1),
      withServices: [],
    );

    connectionStream.listen((connectionState) {
      print('Estado da conexão: ${connectionState.connectionState}');
      if (connectionState.connectionState == DeviceConnectionState.connected) {
        discoverServices();
      }
    }, onError: (error) {
      print('Erro ao conectar: $error');
    });
  }

  void discoverServices() async {
    if (targetDevice == null) return;

    try {
      final services = await flutterReactiveBle.discoverServices(targetDevice!.id);
      for (var service in services) {
        for (var char in service.characteristics) {
          if (char.isWritableWithoutResponse || char.isWritableWithResponse) {
            setState(() {
              characteristic = QualifiedCharacteristic(
                serviceId: service.serviceId,
                characteristicId: char.characteristicId,
                deviceId: targetDevice!.id,
              );
            });
            break;
          }
        }
      }
    } catch (e) {
      print('Erro ao descobrir serviços: $e');
    }
  }

  void sendCommand(String command) async {
    if (characteristic == null) return;

    try {
      await flutterReactiveBle.writeCharacteristicWithResponse(
        characteristic!,
        value: command.codeUnits,
      );
      print('Comando enviado: $command');
    } catch (e) {
      print('Erro ao enviar comando: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 171, 136),
      appBar: AppBar(
        title: const Text('Feeding Page'),
        backgroundColor: const Color.fromARGB(255, 104, 60, 10),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                sendCommand('B'); // Comando para acionar a comida
              },
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 193, 157),
                  border: Border.all(color: const Color.fromARGB(255, 207, 152, 90)),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: const Center(
                  child: Text(
                    'Comida',
                    style: TextStyle(
                      color: Color.fromARGB(255, 104, 60, 10),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                sendCommand('C'); // Comando para acionar a água
              },
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 193, 157),
                  border: Border.all(color: const Color.fromARGB(255, 207, 152, 90)),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: const Center(
                  child: Text(
                    'Água',
                    style: TextStyle(
                      color: Color.fromARGB(255, 104, 60, 10),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
