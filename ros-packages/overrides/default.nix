{ lib }:

final: prev: {
  rosPackages = prev.rosPackages.overrideScope (
    rosFinal: rosPrev:
    (lib.filterAttrs (name: pkg: lib.hasAttr name prev.rosPackages) {
      ament-cmake-vendor-package = rosPrev.ament-cmake-vendor-package.overrideAttrs (
        {
          patches ? [ ],
          propagatedBuildInputs ? [ ],
          ...
        }:
        {
          propagatedBuildInputs = propagatedBuildInputs ++ [ final.git ];
          patches = patches ++ [ ./ament-cmake-vendor-package.patch ];
        }
      );
      rosidl-generator-py = rosPrev.rosidl-generator-py.overrideAttrs (
        {
          depsTargetTargetPropagated ? [ ],
          ...
        }:
        {
          depsTargetTargetPropagated = depsTargetTargetPropagated ++ [ final.pkgsTargetTarget.python3 ];
        }
      );
      libcurl-vendor = rosPrev.libcurl-vendor.overrideAttrs (
        {
          propagatedBuildInputs ? [ ],
          ...
        }:
        {
          postInstall = ''
            ln -s $out/opt/libcurl_vendor/lib64 $out/opt/libcurl_vendor/lib
          '';
          propagatedBuildInputs = propagatedBuildInputs ++ [ final.openssl ];
        }
      );
      python-qt-binding = rosPrev.python-qt-binding.overrideAttrs (
        {
          patches ? [ ],
          ...
        }:
        {
          patches = patches ++ [ ./python-qt-binding.patch ];
        }
      );
      behaviortree-cpp = rosPrev.behaviortree-cpp.overrideAttrs (
        {
          rosCmakeArgs ? [ ],
          doCheck ? false,
          ...
        }:
        {
          rosCmakeArgs = rosCmakeArgs ++ [ "-DBTCPP_UNIT_TESTS=${if doCheck then "ON" else "OFF"}" ];
        }
      );
      gz-gui-vendor = rosPrev.gz-gui-vendor.overrideAttrs (
        {
          nativeBuildInputs ? [ ],
          postInstall ? "",
          ...
        }:
        {
          nativeBuildInputs = nativeBuildInputs ++ [ final.patchelf ];
          # Why is this necessary ???????
          postInstall =
            postInstall
            + ''
              patchelf $out/opt/gz_gui_vendor/lib64/gz-gui-*/plugins/libGrid3D.so --set-rpath ""
            '';
        }
      );
      gz-tools-vendor = rosPrev.gz-tools-vendor.overrideAttrs (
        {
          nativeBuildInputs ? [ ],
          ...
        }:
        {
          nativeBuildInputs = nativeBuildInputs ++ [ final.qt5.wrapQtAppsHook ];
          buildInputs = with final.qt5; [
            qtbase
            qt3d
            qtcharts
            qtconnectivity
            qtdatavis3d
            qtdeclarative
            qtdoc
            qtgraphicaleffects
            qtimageformats
            qtlocation
            qtlottie
            qtmultimedia
            qtquickcontrols
            qtquickcontrols2
            qtscript
            qtsensors
            qtserialport
            qtsvg
            qttools
            qttranslations
            qtvirtualkeyboard
            qtwebchannel
            qtwebengine
            qtwebsockets
            qtwebview
            qtx11extras
            qtxmlpatterns
          ];
          postFixup = ''
            wrapQtApp "$out/opt/gz_tools_vendor/bin/gz"
          '';
        }
      );
      gz-common-vendor = rosPrev.gz-common-vendor.overrideAttrs (
        { passthru, ... }:
        {
          passthru = passthru // {
            sources = passthru.sources.extend (
              finalSources: prevSources: {
                "gz_common_vendor/gz-common" = prevSources."gz_common_vendor/gz-common".override (
                  {
                    patches ? [ ],
                    ...
                  }:
                  {
                    patches = patches ++ [ ./gz-common-filesystem.patch ];
                  }
                );
              }
            );
          };
        }
      );
      librealsense2 = rosPrev.librealsense2.overrideAttrs (
        {
          nativeBuildInputs ? [ ],
          patches ? [ ],
          ...
        }:
        {
          nativeBuildInputs = nativeBuildInputs ++ [ final.autoPatchelfHook ];
          patches = patches ++ [ ./librealsense2-install-presets.patch ];
        }
      );
    })
  );
}
