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
  freeglut,
  gbenchmark,
  glew,
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
  protobuf,
  python3Packages,
  qt5,
  sdformat_vendor,
  substituteSource,
  tinyxml-2,
  util-linux,
  wrapRosQtAppsHook,
  xorg,
}:
let
  sources = rec {
    gz_sim_vendor = substituteSource {
      src = fetchgit {
        name = "gz_sim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sim_vendor-release.git";
        rev = "c0f753371bf676c571049995e5094a117a3801a6";
        hash = "sha256-UUKPw98W66wrptTZTOyVG5yzrMELSFJ9vIrluYTgCGY=";
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
      src = fetchgit {
        name = "gz_sim_vendor-vendor_source-gz-sim-0-source";
        url = "https://github.com/gazebosim/gz-sim.git";
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
  version = "0.0.5-1";
  src = sources.gz_sim_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ freeglut glew gz_cmake_vendor gz_common_vendor gz_fuel_tools_vendor gz_gui_vendor gz_math_vendor gz_msgs_vendor gz_physics_vendor gz_plugin_vendor gz_rendering_vendor gz_sensors_vendor gz_tools_vendor gz_transport_vendor gz_utils_vendor protobuf python3Packages.pybind11 qt5.qtbase qt5.qtdeclarative sdformat_vendor tinyxml-2 util-linux xorg.libXi xorg.libXmu ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint python3Packages.pytest xorg.xorgserver ];
  missingDependencies = [ "gz-sim8" "libfreeimage-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-settings" "qml-module-qtgraphicaleffects" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-layouts" "qml-module-qtquick2" ];
  meta = {
    description = "Vendor package for: gz-sim8 8.6.0 Gazebo Sim : A Robotic Simulator";
  };
}
