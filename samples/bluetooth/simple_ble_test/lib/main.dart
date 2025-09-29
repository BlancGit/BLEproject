import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLE Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BLETestPage(),
    );
  }
}

class BLETestPage extends StatefulWidget {
  @override
  _BLETestPageState createState() => _BLETestPageState();
}

class _BLETestPageState extends State<BLETestPage> {
  BluetoothDevice? connectedDevice;
  bool isScanning = false;
  bool isConnected = false;
  String statusMessage = "Ready to scan";

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();
  }

  Future<void> scanAndConnect() async {
    setState(() {
      isScanning = true;
      statusMessage = "Scanning for SC NUS Peripheral...";
    });

    // Start scanning
    FlutterBluePlus.startScan(timeout: Duration(seconds: 10));

    // Listen for scan results
    FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult result in results) {
        // Look for our device
        if (result.device.localName == "SC NUS Peripheral") {
          print("Found SC NUS Peripheral!");
          setState(() {
            statusMessage = "Found device! Connecting...";
          });
          
          // Stop scanning
          FlutterBluePlus.stopScan();
          
          // Connect to device
          try {
            await result.device.connect();
            setState(() {
              connectedDevice = result.device;
              isConnected = true;
              isScanning = false;
              statusMessage = "Connected to SC NUS Peripheral ✓";
            });
            
            // Listen for disconnection
            result.device.connectionState.listen((state) {
              if (state == BluetoothConnectionState.disconnected) {
                setState(() {
                  isConnected = false;
                  connectedDevice = null;
                  statusMessage = "Disconnected ❌";
                });
              }
            });
            
          } catch (e) {
            setState(() {
              isScanning = false;
              statusMessage = "Connection failed: $e";
            });
          }
          break;
        }
      }
    });

    // Handle scan timeout
    await Future.delayed(Duration(seconds: 10));
    if (!isConnected) {
      FlutterBluePlus.stopScan();
      setState(() {
        isScanning = false;
        statusMessage = "Device not found. Make sure it's advertising.";
      });
    }
  }

  Future<void> disconnect() async {
    if (connectedDevice != null) {
      await connectedDevice!.disconnect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLE Test App'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isConnected ? Icons.bluetooth_connected : Icons.bluetooth,
                size: 80,
                color: isConnected ? Colors.green : Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                'SC NUS Peripheral',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: isConnected ? Colors.green.shade100 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  statusMessage,
                  style: TextStyle(
                    fontSize: 16,
                    color: isConnected ? Colors.green.shade800 : Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              if (!isConnected && !isScanning)
                ElevatedButton(
                  onPressed: scanAndConnect,
                  child: Text('Scan & Connect'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
              if (isScanning)
                CircularProgressIndicator(),
              if (isConnected)
                ElevatedButton(
                  onPressed: disconnect,
                  child: Text('Disconnect'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
              SizedBox(height: 20),
              Text(
                'Device Info:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (connectedDevice != null) ...[
                Text('Name: ${connectedDevice!.localName}'),
                Text('ID: ${connectedDevice!.remoteId}'),
              ] else
                Text('No device connected'),
            ],
          ),
        ),
      ),
    );
  }
}