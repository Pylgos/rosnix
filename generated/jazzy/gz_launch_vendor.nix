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
  gz_gui_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_plugin_vendor,
  gz_sim_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    gz_launch_vendor = substituteSource {
      src = fetchgit {
        name = "gz_launch_vendor-source";
        url = "https://github.com/ros2-gbp/gz_launch_vendor-release.git";
        rev = "63ebf9304161d4f6e825f4c7f187d1aa3faad325";
        hash = "sha256-VSb5c56y1Qh6bWn2Xg1tr6Fcslrr56pPN5k01OFxHe8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_launch_vendor-vendor_source-gz-launch-0}";
        }
      ];
    };
    gz_launch_vendor-vendor_source-gz-launch-0 = substituteSource {
      src = fetchgit {
        name = "gz_launch_vendor-vendor_source-gz-launch-0-source";
        url = "https://github.com/gazebosim/gz-launch.git";
        rev = "1317511d365d1b2c312c86f9062b8a4b7bfdc132";
        hash = "sha256-En3V8i/Ie8+KnSHGlm9Bap7REdLhYBaVHVbOM+/Pzno=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_launch_vendor";
  version = "0.0.4-1";
  src = sources.gz_launch_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_gui_vendor gz_math_vendor gz_msgs_vendor gz_plugin_vendor gz_sim_vendor gz_tools_vendor gz_transport_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "gz-launch7" "libgflags-dev" "libwebsockets-dev" "libxi-dev" "libxmu-dev" "libyaml-dev" "tinyxml2" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  meta = {
    description = "Vendor package for: gz-launch7 7.1.0 Gazebo Launch : Run and manage programs and plugins";
  };
}
