import 'package:flutter/material.dart';
import 'package:test/core/network/connectivity_controller.dart';
import 'package:test/core/network/network_banner.dart';

class NetworkStatusWrapper extends StatefulWidget {
  final Widget child;

  const NetworkStatusWrapper({super.key, required this.child});

  @override
  State<NetworkStatusWrapper> createState() => _NetworkStatusWrapperState();
}

class _NetworkStatusWrapperState extends State<NetworkStatusWrapper> {
  bool _hasShownInitialBanner = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, isConnected, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!_hasShownInitialBanner) {
            if (!isConnected) {
              NetworkBanner.show(context, NetworkStatusType.disconnected);
            }
            _hasShownInitialBanner = true;
          } else {
            NetworkBanner.show(
              context,
              isConnected
                  ? NetworkStatusType.connected
                  : NetworkStatusType.disconnected,
            );
          }
        });

        return widget.child;
      },
    );
  }
}
