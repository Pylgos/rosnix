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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz-msgs-vendor_source-0da35a8b1239c3186e398ac4ed2dbe1762f3aaa4 = substituteSource {
      src = fetchgit {
        name = "gz-msgs-vendor_source-0da35a8b1239c3186e398ac4ed2dbe1762f3aaa4-source";
        url = "https://github.com/gazebosim/gz-msgs.git";
        rev = "0da35a8b1239c3186e398ac4ed2dbe1762f3aaa4";
        hash = "sha256-PQT8EpTxafldnKG3hDSXw2P22gLRg2EfMllrzaTaDEw=";
      };
      substitutions = [
      ];
    };
    gz_msgs_vendor-25905a007be43a355645730c7be99fad30cc7636 = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-25905a007be43a355645730c7be99fad30cc7636-source";
        url = "https://github.com/ros2-gbp/gz_msgs_vendor-release.git";
        rev = "25905a007be43a355645730c7be99fad30cc7636";
        hash = "sha256-0geXZdTt4n0yj0TwzXFxblk35LrxZePiOVTUBPLkwH4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz-msgs-vendor_source-0da35a8b1239c3186e398ac4ed2dbe1762f3aaa4}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_msgs_vendor";
  version = "0.0.4-1";
  src = sources.gz_msgs_vendor-25905a007be43a355645730c7be99fad30cc7636;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_tools_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-msgs10" "protobuf-dev" "python3" "python3-protobuf" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Vendor package for: gz-msgs10 10.3.0 Gazebo Messages: Protobuf messages and functions for robot applications";
  };
}
