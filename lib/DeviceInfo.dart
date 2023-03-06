import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/DeviceStoragesInfo.dart';
import 'package:insurance_app/ScreenTest.dart';
import 'package:insurance_app/UserInfo.dart';
import 'package:insurance_app/UserProfile.dart';
import 'package:storage_info/storage_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Quotes.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      phone: json['Phone'],
      email: json['Email'],
    );
  }
}

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key});

  @override
  State<DeviceInfo> createState() {
    return _DeviceInfoState();
  }
}

class _DeviceInfoState extends State<DeviceInfo> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  late String? board;
  late String? brand;
  late String? device;
  late String? display;
  late String? fingerprint;
  late String? hardware;
  late String? host;
  // late String? HandsetId;
  late String? manufacturer;
  late String? model;
  late String? product;
  late bool isLoading = false;
  final _storage = const FlutterSecureStorage();
  late String? auth;
  late bool isLoggedIn = false;
  late int? userAccountId;
  Future<User>? profile;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  Future<void> _readAccess() async {
    final access = await _storage.read(
        key: 'token',
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    if (access != null) {
      // setState(() {
      //   auth = access;
      //   // fetchUser(auth);
      // });
      String normalizedSource = base64Url.normalize(access.split(".")[1]);
      var result = utf8.decode(base64Url.decode(normalizedSource));
      Map<String, dynamic> tokenDecoded = json.decode(result);
      setState(() {
        isLoggedIn = true;
        userAccountId = tokenDecoded['Id'];
      });
      // profile = _getProfile(userAccountId);
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _readAccess();
  }

  Future<double> _getSpace() async {
    return await StorageInfo.getStorageTotalSpaceInGB;
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (Platform.isLinux) {
          deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          deviceData =
              _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      // 'version.securityPatch': build.version.securityPatch,
      // 'version.sdkInt': build.version.sdkInt,
      // 'version.release': build.version.release,
      // 'version.previewSdkInt': build.version.previewSdkInt,
      // 'version.incremental': build.version.incremental,
      // 'version.codename': build.version.codename,
      // 'version.baseOS': build.version.baseOS,
      'board': build.board,
      // 'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      // 'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      // 'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      // 'supported32BitAbis': build.supported32BitAbis,
      // 'supported64BitAbis': build.supported64BitAbis,
      // 'supportedAbis': build.supportedAbis,
      // 'tags': build.tags,
      // 'type': build.type,
      // 'isPhysicalDevice': build.isPhysicalDevice,
      // 'systemFeatures': build.systemFeatures,
      // 'displaySizeInches':
      // ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      // 'displayWidthPixels': build.displayMetrics.widthPx,
      // 'displayWidthInches': build.displayMetrics.widthInches,
      // 'displayHeightPixels': build.displayMetrics.heightPx,
      // 'displayHeightInches': build.displayMetrics.heightInches,
      // 'displayXDpi': build.displayMetrics.xDpi,
      // 'displayYDpi': build.displayMetrics.yDpi,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
      'userName': data.userName,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'buildNumber': data.buildNumber,
      'platformId': data.platformId,
      'csdVersion': data.csdVersion,
      'servicePackMajor': data.servicePackMajor,
      'servicePackMinor': data.servicePackMinor,
      'suitMask': data.suitMask,
      'productType': data.productType,
      'reserved': data.reserved,
      'buildLab': data.buildLab,
      'buildLabEx': data.buildLabEx,
      'digitalProductId': data.digitalProductId,
      'displayVersion': data.displayVersion,
      'editionId': data.editionId,
      'installDate': data.installDate,
      'productId': data.productId,
      'productName': data.productName,
      'registeredOwner': data.registeredOwner,
      'releaseId': data.releaseId,
      'deviceId': data.deviceId,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
          title: Text(
            kIsWeb
                ? 'Web Browser info'
                : Platform.isAndroid
                    ? 'Android Device Info'
                    : Platform.isIOS
                        ? 'iOS Device Info'
                        : Platform.isLinux
                            ? 'Linux Device Info'
                            : Platform.isMacOS
                                ? 'MacOS Device Info'
                                : Platform.isWindows
                                    ? 'Windows Device Info'
                                    : '',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          child: const Text(
                            "Your mobile device can be insured",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView(
                                      children: _deviceData.keys.map(
                                        (String property) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  '$property : ',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text(
                                                    '${_deviceData[property]}',
                                                    maxLines: 10,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              // FutureBuilder(
                              //     future: _getSpace(),
                              //     builder: (context, snapshot) {
                              //       // print(snapshot.error);
                              //       if (snapshot.hasData) {
                              //         return Container(
                              //           alignment: Alignment.centerLeft,
                              //           padding: const EdgeInsets.all(10),
                              //           child: Text(
                              //             'Internal Storage Space: ${snapshot.data} GB',
                              //             style: const TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //             ),
                              //           ),
                              //         );
                              //       } else {
                              //         return Container(
                              //             alignment: Alignment.centerLeft,
                              //             padding: const EdgeInsets.all(10),
                              //             child: const Text(
                              //               "Loading",
                              //               style: TextStyle(
                              //                 fontWeight: FontWeight.normal,
                              //               ),
                              //             ));
                              //       }
                              //     }),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Storage Space Information',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding: const EdgeInsets.all(1),
                          child: const DeviceStoragesInfo()),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        // alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.all(10),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: const Color.fromRGBO(109, 21, 23, 1),
                            // textColor: Colors.white,
                            onPressed: () async {
                              // print(_deviceData);
                              try {
                                setState(() {
                                  isLoading = true;
                                  // board = _deviceData[board];
                                  // brand = _deviceData[brand];
                                  device = _deviceData["device"];
                                  // display = _deviceData[display];
                                  // fingerprint = _deviceData[fingerprint];
                                  hardware = _deviceData["hardware"];
                                  host = _deviceData["host"];
                                  // HandsetId = _deviceData["id"];
                                  manufacturer = _deviceData["manufacturer"];
                                  model = _deviceData["model"];
                                  product = _deviceData["product"];
                                });
                                final http.Response response = await http.put(
                                    Uri.parse(
                                        'https://insurancebackendapi-5yi8.onrender.com/api/users/user/edit/$userAccountId'),
                                    // 'https://localhost:7000/api/user/edit/$userAccountId'),
                                    headers: {
                                      // 'Content-Type':
                                      //     'multipart/form-data',
                                      'Content-Type': 'application/json',
                                    },
                                    body: jsonEncode(
                                      {
                                        // "Board": board,
                                        // "brand": brand,
                                        "Device": device,
                                        // "display": display,
                                        // "fingerprint": fingerprint,
                                        "HardWare": hardware,
                                        // "host": host,
                                        // "HandsetId": HandsetId,
                                        // "IMEI1": manufacturer,
                                        // "IMEI2":
                                        "SerialNo": model,
                                        "Platform": product,
                                      },
                                    ));
                                if (response.statusCode == 200) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenTest()),
                                  );
                                } else if (response.statusCode == 404) {
                                  throw Exception('User edit failed!');
                                  // print(response);
                                }
                              } catch (e) {
                                // ignore: avoid_print
                                print(e);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: const Text(
                                'Verify Your Device Information',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            )),
                      ),
                      // const DeviceStoragesInfo(),
                    ],
                  ),
                ),
              ]),
        ),
        bottomNavigationBar: const BottomNavigation());
  }
}
