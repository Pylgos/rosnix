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
  gz_math_vendor,
  gz_tools_vendor,
  protobuf,
  python3,
  python3Packages,
  substituteSource,
  tinyxml-2,
}:
let
  sources = rec {
    gz_msgs_vendor = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-source";
        url = "https://github.com/ros2-gbp/gz_msgs_vendor-release.git";
        rev = "25905a007be43a355645730c7be99fad30cc7636";
        hash = "sha256-0geXZdTt4n0yj0TwzXFxblk35LrxZePiOVTUBPLkwH4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_msgs_vendor-vendor_source-gz-msgs-0}";
        }
      ];
    };
    gz_msgs_vendor-vendor_source-gz-msgs-0 = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-vendor_source-gz-msgs-0-source";
        url = "https://github.com/gazebosim/gz-msgs.git";
        rev = "0da35a8b1239c3186e398ac4ed2dbe1762f3aaa4";
        hash = "sha256-PQT8EpTxafldnKG3hDSXw2P22gLRg2EfMllrzaTaDEw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_msgs_vendor";
  version = "0.0.4-1";
  src = sources.gz_msgs_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_tools_vendor protobuf python3 python3Packages.protobuf tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint python3Packages.pytest ];
  missingDependencies = [ "gz-msgs10" ];
  meta = {
    description = "Vendor package for: gz-msgs10 10.3.0 Gazebo Messages: Protobuf messages and functions for robot applications";
  };
}
