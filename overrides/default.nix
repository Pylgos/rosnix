{ lib, config }:

final: prev: {
  rosPackages = prev.rosPackages.overrideScope (
    rosFinal: rosPrev:
    (lib.filterAttrs (name: pkg: lib.hasAttr name prev.rosPackages) {
      ament_cmake_vendor_package = rosPrev.ament_cmake_vendor_package.overrideAttrs (
        {
          patches ? [ ],
          propagatedBuildInputs ? [ ],
          ...
        }:
        {
          propagatedBuildInputs = propagatedBuildInputs ++ [ final.git ];
          patches = patches ++ [ ./ament_cmake_vendor_package.patch ];
        }
      );
      rosidl_generator_py = rosPrev.rosidl_generator_py.overrideAttrs (
        {
          depsTargetTargetPropagated ? [ ],
          ...
        }:
        {
          depsTargetTargetPropagated = depsTargetTargetPropagated ++ [ final.pkgsTargetTarget.python3 ];
        }
      );
      libcurl_vendor = rosPrev.libcurl_vendor.overrideAttrs (
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
      python_qt_binding = rosPrev.python_qt_binding.overrideAttrs (
        {
          patches ? [ ],
          ...
        }:
        {
          patches = patches ++ [ ./python_qt_binding.patch ];
        }
      );
      behaviortree_cpp = rosPrev.behaviortree_cpp.overrideAttrs (
        {
          rosCmakeArgs ? [ ],
          doCheck ? false,
          ...
        }:
        {
          rosCmakeArgs = rosCmakeArgs ++ [ "-DBTCPP_UNIT_TESTS=${if doCheck then "ON" else "OFF"}" ];
        }
      );
      gz_gui_vendor = rosPrev.gz_gui_vendor.overrideAttrs (
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
              patchelf $out/opt/gz_gui_vendor/lib64/gz-gui-8/plugins/libGrid3D.so --set-rpath ""
            '';
        }
      );
      gz_tools_vendor = rosPrev.gz_tools_vendor.overrideAttrs (
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
            qtwayland
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
    })
  );
}
