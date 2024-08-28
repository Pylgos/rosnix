{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_rendering_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  sdformat_vendor,
  substituteSource,
  xorg,
}:
let
  sources = rec {
    gz_sensors_vendor = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sensors_vendor-release.git";
        rev = "085d65b284ef6a7536ff40f18e64e298e56f0ec0";
        hash = "sha256-lIlYTD+b6EjuknN8kJlsw7yW6ti8Nu+XTiF1pyKE5EU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_sensors_vendor-vendor_source-gz-sensors-0}";
        }
      ];
    };
    gz_sensors_vendor-vendor_source-gz-sensors-0 = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-vendor_source-gz-sensors-0-source";
        url = "https://github.com/gazebosim/gz-sensors.git";
        rev = "410a999f1e0e91bdcf81c6aff70fa3e95e369757";
        hash = "sha256-j/8kS+Bvaim2gtsZcp+/u8CAE+N24/5qZhciFR0Q8+M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_sensors_vendor";
  version = "0.0.4-1";
  src = sources.gz_sensors_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_math_vendor gz_msgs_vendor gz_rendering_vendor gz_tools_vendor gz_transport_vendor sdformat_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint xorg.xorgserver ];
  missingDependencies = [ "gz-sensors8" ];
  meta = {
    description = "Vendor package for: gz-sensors8 8.2.0 Gazebo Sensors : Sensor models for simulation";
  };
}
