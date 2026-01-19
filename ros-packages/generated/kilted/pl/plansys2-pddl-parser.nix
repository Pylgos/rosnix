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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_pddl_parser";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_pddl_parser";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ plansys2-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs ];
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_pddl_parser" = substituteSource {
      src = fetchgit {
        name = "plansys2_pddl_parser-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "7a0325bffc23ee893451affc9e610443b5113284";
        hash = "sha256-ekXykmiful5iMNgXKMaEVuGnwwND8lFpBdqYO9onk8E=";
      };
    };
  });
  meta = {
    description = "This package contains a library for parsing PDDL domains and problems.\n  \n    This package derives from the work of Anders Jonsson, contained in https://github.com/wisdompoet/universal-pddl-parser.git\n    with many modifications by Francisco Martin:\n      * ROS2 packaging\n      * Source code structure refactor\n      * CMakeLists.txt for cmake compilation\n      * Reading from String instead of files\n      * Licensing\n  ";
  };
})
