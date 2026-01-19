{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-msgs,
  plansys2-pddl-parser,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_core";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ plansys2-msgs plansys2-pddl-parser rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs plansys2-pddl-parser rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_core" = substituteSource {
      src = fetchgit {
        name = "plansys2_core-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "6145ccf35fdb362fb3b2634bb5c9238f4f92af94";
        hash = "sha256-2LXy2wtlHlrCdQakX/EHW9I/Q2JJk6IQ13jLOGTIJaI=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based core  for the ROS2 Planning System";
  };
})
