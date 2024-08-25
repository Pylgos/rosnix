{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  console-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  substituteSource,
}:
let
  sources = rec {
    console_bridge_vendor = substituteSource {
      src = fetchgit {
        name = "console_bridge_vendor-source";
        url = "https://github.com/ros2-gbp/console_bridge_vendor-release.git";
        rev = "c97161d134fcd42931398bc84d983db96ce347f0";
        hash = "sha256-9CPFQxBlphIp4nGlZ0XgD45yWH2xTww/uLFZgby9D28=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros/console_bridge.git";
          to = "VCS_TYPE path VCS_URL ${console_bridge_vendor-vendor_source-console_bridge-0}";
        }
      ];
    };
    console_bridge_vendor-vendor_source-console_bridge-0 = substituteSource {
      src = fetchgit {
        name = "console_bridge_vendor-vendor_source-console_bridge-0-source";
        url = "https://github.com/ros/console_bridge.git";
        rev = "0828d846f2d4940b4e2b5075c6c724991d0cd308";
        hash = "sha256-M3GocT0hodw3Sc2NHcFDiPVZ1XN7BqIUuYLW8OaXMqM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "console_bridge_vendor";
  version = "1.8.0-1";
  src = sources.console_bridge_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around console_bridge, providing nothing but a dependency on console_bridge, on some systems. On others, it provides an ExternalProject build of console_bridge.";
  };
}
