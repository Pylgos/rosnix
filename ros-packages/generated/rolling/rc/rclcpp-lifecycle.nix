{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcl,
  rcl-interfaces,
  rcl-lifecycle,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl-typesupport-cpp,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp_lifecycle";
  version = "29.6.0-1";
  src = finalAttrs.passthru.sources."rclcpp_lifecycle";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl rcl-lifecycle rclcpp ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl rcl-lifecycle rclcpp ];
  depsTargetTargetPropagated = [ lifecycle-msgs rcl-interfaces rcutils rmw rosidl-typesupport-cpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture rcpputils test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclcpp_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "6cafe6d1249734ef0efbe73c4ad0270a2e291b5b";
        hash = "sha256-6zyJI46lrGpBJ9IqnStt28Jt/58NJ9Fy8JZQI9b6UEY=";
      };
    };
  });
  meta = {
    description = "Package containing a prototype for lifecycle implementation";
  };
})
