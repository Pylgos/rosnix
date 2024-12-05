{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-msgs,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_pddl_parser";
  version = "2.0.15-1";
  src = finalAttrs.passthru.sources."plansys2_pddl_parser";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs rclcpp std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_pddl_parser" = substituteSource {
      src = fetchgit {
        name = "plansys2_pddl_parser-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "7a569b9b0d00d85961f5da367f59b9078b592fec";
        hash = "sha256-SUpbYokblpQa1wYjDCZ6xZwPq6qenkZkPRFo/6iLcUQ=";
      };
    };
  });
  meta = {
    description = "This package contains a library for parsing PDDL domains and problems. This package derives from the work of Anders Jonsson, contained in https://github.com/wisdompoet/universal-pddl-parser.git with many modifications by Francisco Martin: * ROS2 packaging * Source code structure refactor * CMakeLists.txt for cmake compilation * Reading from String instead of files * Licensing";
  };
})
