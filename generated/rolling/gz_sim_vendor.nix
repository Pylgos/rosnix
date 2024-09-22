{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_fuel_tools_vendor,
  gz_gui_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_physics_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_sensors_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  gz_utils_vendor,
  rosSystemPackages,
  sdformat_vendor,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    gz_sim_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "gz_sim_vendor-source";
        owner = "ros2-gbp";
        repo = "gz_sim_vendor-release";
        rev = "b976178a7665e19abeb4fff7863f546ec1bf154c";
        hash = "sha256-PSUWqi5eGOz+xT6Mg3tSx1Fk+IRDJaBkRKyeLmuZRZA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_sim_vendor-vendor_source-gz-sim-0}";
        }
      ];
    };
    gz_sim_vendor-vendor_source-gz-sim-0 = substituteSource {
      src = fetchFromGitHub {
        name = "gz_sim_vendor-vendor_source-gz-sim-0-source";
        owner = "gazebosim";
        repo = "gz-sim";
        rev = "4226d04fa3e51c6d4cf5970a2915d5891af37501";
        hash = "sha256-zSiPHEh3h2J8hGL342tde5U9FLaGnWs72WD9BqyPf6E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_sim_vendor";
  version = "0.1.2-1";
  src = sources.gz_sim_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_fuel_tools_vendor gz_gui_vendor gz_math_vendor gz_msgs_vendor gz_physics_vendor gz_plugin_vendor gz_rendering_vendor gz_sensors_vendor gz_tools_vendor gz_transport_vendor gz_utils_vendor sdformat_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "gz-sim8" "libfreeimage-dev" "libglew-dev" "libxi-dev" "libxmu-dev" "protobuf-dev" "pybind11-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-settings" "qml-module-qtgraphicaleffects" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-layouts" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "tinyxml2" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "xvfb" ]; };
  meta = {
    description = "Vendor package for: gz-sim8 8.6.0 Gazebo Sim : A Robotic Simulator";
  };
}
