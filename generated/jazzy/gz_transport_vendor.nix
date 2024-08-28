{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildPackages,
  buildRosPackage,
  cppzmq,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  sqlite,
  substituteSource,
  util-linux,
}:
let
  sources = rec {
    gz_transport_vendor = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-source";
        url = "https://github.com/ros2-gbp/gz_transport_vendor-release.git";
        rev = "507e93357bfe90f8a3a4c11a3e09fbbd3fa501fc";
        hash = "sha256-LJR/bu6SYZ/U+NsUqQuHEVALhkJyStdp7Tb8Fi1TZ5s=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_transport_vendor-vendor_source-gz-transport-0}";
        }
      ];
    };
    gz_transport_vendor-vendor_source-gz-transport-0 = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-vendor_source-gz-transport-0-source";
        url = "https://github.com/gazebosim/gz-transport.git";
        rev = "73757e716dcf21e395e1884fbfb4afc6bac10d85";
        hash = "sha256-2Akd3vKr07IdgoJppvUV1nZlHE4RdQfI2R18ihHTDHk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_transport_vendor";
  version = "0.0.5-1";
  src = sources.gz_transport_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_utils_vendor pkg-config python3 buildPackages.python3Packages.pybind11 buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppzmq gz_msgs_vendor gz_tools_vendor protobuf python3Packages.psutil sqlite util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ];
  missingDependencies = [ "gz-transport13" ];
  meta = {
    description = "Vendor package for: gz-transport13 13.4.0 Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.";
  };
}
