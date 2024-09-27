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
  mkSourceSet,
  rosSystemPackages,
  sdformat_vendor,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "gz_sensors_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sensors_vendor-release.git";
        rev = "f836c42389a9bb67b9413bdeb8d700731339f361";
        hash = "sha256-5b8RzqNgVk6eBfSB3CBpUlMG1cM97zHypI+RHqwkAWI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_sensors_vendor/gz-sensors"}";
        }
      ];
    };
    "gz_sensors_vendor/gz-sensors" = substituteSource {
      src = fetchgit {
        name = "gz-sensors-source";
        url = "https://github.com/gazebosim/gz-sensors.git";
        rev = "410a999f1e0e91bdcf81c6aff70fa3e95e369757";
        hash = "sha256-j/8kS+Bvaim2gtsZcp+/u8CAE+N24/5qZhciFR0Q8+M=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gz_sensors_vendor";
  version = "0.1.2-3";
  src = sources."gz_sensors_vendor";
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_math_vendor gz_msgs_vendor gz_rendering_vendor gz_tools_vendor gz_transport_vendor sdformat_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-sensors8" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  meta = {
    description = "Vendor package for: gz-sensors8 8.2.0 Gazebo Sensors : Sensor models for simulation";
  };
}
