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
          preBuild = ''
            printenv PATH
          '';
        }
      );
      rosidl-generator-py = rosPrev.rosidl-generator-py.overrideAttrs (
        {
          depsTargetTargetPropagated ? [ ],
          ...
        }:
        {
          depsTargetTargetPropagated = depsTargetTargetPropagated ++ [ final.pkgsTargetTarget.rosPython ];
        }
      );
      rmw-implementation = rosPrev.rmw-implementation.overrideAttrs {
        propagatedBuildInputs =
          with rosFinal;
          [
            ament-index-cpp
            rcpputils
            rcutils
            rmw
          ]
          ++ final.rosConfig.defaultRmwImplementation;
        cmakeFlags = [
          "-DRMW_IMPLEMENTATION_DISABLE_RUNTIME_SELECTION=${
            if final.rosConfig.disableRmwRuntimeSelection then "ON" else "OFF"
          }"
        ];
      };
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
          cmakeFlags ? [ ],
          doCheck ? false,
          ...
        }:
        {
          cmakeFlags = cmakeFlags ++ [ "-DBTCPP_UNIT_TESTS=${if doCheck then "ON" else "OFF"}" ];
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
      cartographer = rosPrev.cartographer.overrideAttrs (
        {
          nativeBuildInputs ? [ ],
          ...
        }:
        {
          nativeBuildInputs = nativeBuildInputs ++ final.rosSystemPackages.protobuf-dev;
          postPatch = ''
            (
              shopt -s globstar
              for file in **/*.cc **/*.h; do
                # See https://github.com/cartographer-project/cartographer/pull/1919
                substituteInPlace "$file" \
                  --replace-quiet ' LOCKS_EXCLUDED' ' ABSL_LOCKS_EXCLUDED' \
                  --replace-quiet ' GUARDED_BY' ' ABSL_GUARDED_BY' \
                  --replace-quiet ' EXCLUSIVE_LOCKS_REQUIRED' ' ABSL_EXCLUSIVE_LOCKS_REQUIRED'
              done
            )
          '';
        }
      );
    })
  );
}
