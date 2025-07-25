{ lib }:

final: prev:
let
  inherit (final.rosConfig) distro;
  makePatch = final.callPackage ./make-patch.nix { };
  getSource = p: builtins.filterSource (path: type: true) p;
  nav2-costmap-2d-patch = makePatch "nav2-costmap-2d.patch" (final.fetchgit {
    name = "nav2_costmap_2d-source";
    url = "https://github.com/SteveMacenski/navigation2-release.git";
    rev = "46cc562b9f04c067746ddd463e2b97fb263132a7";
    hash = "sha256-G7HOD6Z/hdpAT1Z/ZQsSIKuvE6M+fFbMA5ITMIEQgBI=";
  }) (getSource ./patch-sources/nav2-costmap-2d);
  nav2-rviz-plugins-patch = makePatch "nav2-rviz-plugins.patch" (final.fetchgit {
    name = "nav2_rviz_plugins-source";
    url = "https://github.com/SteveMacenski/navigation2-release.git";
    rev = "93d970dc9a2ba0ae6d8cf1dda03aa3ca4e4dc8cf";
    hash = "sha256-kUCfSM3OVJHIsXBY2ovsiqR1jMhPdL9TcxFXExll4nA=";
  }) (getSource ./patch-sources/nav2-rviz-plugins);
in
{
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
            if [[ -d $out/colcon-prefix/opt/libcurl_vendor/lib64 ]]; then
              ln -s $out/colcon-prefix/opt/libcurl_vendor/lib64 $out/opt/libcurl_vendor/lib
            fi
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
          passthru,
          ...
        }:
        {
          passthru = passthru // {
            sources = passthru.sources.extend (
              finalSources: prevSources: {
                "gz_gui_vendor/gz-gui" = prevSources."gz_gui_vendor/gz-gui".override (
                  {
                    patches ? [ ],
                    ...
                  }:
                  {
                    patches = patches ++ [ ./gz-gui-style.patch ];
                  }
                );
              }
            );
          };
          nativeBuildInputs = nativeBuildInputs ++ [ final.patchelf ];
          # Why is this necessary ???????
          postInstall =
            postInstall
            + ''
              patchelf $out/colcon-prefix/opt/gz_gui_vendor/lib64/gz-gui-*/plugins/libGrid3D.so --set-rpath ""
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
            wrapQtApp "$out/colcon-prefix/opt/gz_tools_vendor/bin/gz"
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
      gz-transport-vendor = rosPrev.gz-transport-vendor.overrideAttrs (
        {
          buildInputs ? [ ],
          ...
        }:
        {
          # Ref: https://github.com/lopsided98/nix-ros-overlay/pull/228
          buildInputs = buildInputs ++ [ final.libsodium ];
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
      ros-gz-sim = rosPrev.ros-gz-sim.overrideAttrs (
        {
          postPatch ? "",
          ...
        }:
        {
          postPatch =
            postPatch
            + ''
              substituteInPlace launch/gz_sim.launch.py.in \
                --replace-fail "'ruby ' + get_executable_path('gz') + ' sim'" '"gz sim"'
            '';
        }
      );
      nav2-costmap-2d = rosPrev.nav2-costmap-2d.overrideAttrs (
        {
          patches ? [ ],
          ...
        }:
        {
          patches = patches ++ [ nav2-costmap-2d-patch ];
          NIX_CFLAGS_COMPILE = [
            "-Wno-error"
          ];
        }
      );
      nav2-rviz-plugins = rosPrev.nav2-rviz-plugins.overrideAttrs (
        {
          patches ? [ ],
          ...
        }:
        {
          patches = patches ++ [ nav2-rviz-plugins-patch ];
        }
      );
      zenoh-cpp-vendor = rosPrev.zenoh-cpp-vendor.overrideAttrs (
        {
          nativeBuildInputs ? [ ],
          postPatch ? "",
          passthru,
          ...
        }:
        let
          zenoh-c-src = passthru.sources."zenoh_cpp_vendor/zenoh-c";
        in
        {
          postPatch =
            postPatch
            + ''
              cp ${zenoh-c-src}/Cargo.lock .
            '';
          nativeBuildInputs = nativeBuildInputs ++ [
            final.cargo
            final.rustPlatform.cargoSetupHook
          ];
          cargoDeps = final.rustPlatform.fetchCargoVendor {
            src = zenoh-c-src;
            hash =
              let
                path = ./${distro}/cargo-hashes/zenoh-cpp-vendor.nix;
              in
              if builtins.pathExists path then import path else lib.fakeHash;
          };
        }
      );
      webots-ros2-driver = rosPrev.webots-ros2-driver.overrideAttrs (
        {
          postPatch ? "",
          ...
        }:
        {
          postPatch =
            postPatch
            + ''
              substituteInPlace webots_ros2_driver/webots_launcher.py \
                --replace-fail 'shutil.copy2(world_path, self.__world_copy.name)' 'shutil.copyfile(world_path, self.__world_copy.name)'
            '';
        }
      );
    })
  );
}
