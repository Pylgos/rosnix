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
  gz_msgs_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz-transport-vendor_source-73757e716dcf21e395e1884fbfb4afc6bac10d85 = substituteSource {
      src = fetchgit {
        name = "gz-transport-vendor_source-73757e716dcf21e395e1884fbfb4afc6bac10d85-source";
        url = "https://github.com/gazebosim/gz-transport.git";
        rev = "73757e716dcf21e395e1884fbfb4afc6bac10d85";
        hash = "sha256-2Akd3vKr07IdgoJppvUV1nZlHE4RdQfI2R18ihHTDHk=";
      };
      substitutions = [
      ];
    };
    gz_transport_vendor-c8c307618da42388953426950d9153192e655929 = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-c8c307618da42388953426950d9153192e655929-source";
        url = "https://github.com/ros2-gbp/gz_transport_vendor-release.git";
        rev = "c8c307618da42388953426950d9153192e655929";
        hash = "sha256-SoTRYKwraLJ9eQAUVK/DpiIMIoEw3WDSGDeh7tLy3sU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz-transport-vendor_source-73757e716dcf21e395e1884fbfb4afc6bac10d85}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_transport_vendor";
  version = "0.1.2-2";
  src = sources.gz_transport_vendor-c8c307618da42388953426950d9153192e655929;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "python3-dev" "python3-pytest" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_msgs_vendor gz_tools_vendor gz_utils_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-transport13" "libsqlite3-dev" "libzmq3-dev" "protobuf-dev" "pybind11-dev" "python3-psutil" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for: gz-transport13 13.4.0 Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.";
  };
}
