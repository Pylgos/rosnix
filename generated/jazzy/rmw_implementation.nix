{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcpputils,
  rcutils,
  rmw,
  rmw_connextdds,
  rmw_cyclonedds_cpp,
  rmw_fastrtps_cpp,
  rmw_fastrtps_dynamic_cpp,
  rmw_implementation_cmake,
  substituteSource,
}:
let
  sources = rec {
    rmw_implementation = substituteSource {
      src = fetchgit {
        name = "rmw_implementation-source";
        url = "https://github.com/ros2-gbp/rmw_implementation-release.git";
        rev = "6f7fca96237a7a41e888dc55ff8406876dd3cd1b";
        hash = "sha256-m0Kurk9EC6Yc7JrKHFGjSZ5eIanWr0QxoYkXWNLXQ2o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation";
  version = "2.15.3-1";
  src = sources.rmw_implementation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rmw_implementation_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp rcpputils rcutils rmw rmw_connextdds rmw_cyclonedds_cpp rmw_fastrtps_cpp rmw_fastrtps_dynamic_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Proxy implementation of the ROS 2 Middleware Interface.";
  };
}
