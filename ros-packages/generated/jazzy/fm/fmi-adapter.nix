{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmilibrary-vendor,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rcutils,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fmi_adapter";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."fmi_adapter";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fmilibrary-vendor launch launch-ros rcl-interfaces rclcpp rclcpp-components rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing rcutils ];
  passthru.sources = mkSourceSet (sources: {
    "fmi_adapter" = substituteSource {
      src = fetchgit {
        name = "fmi_adapter-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "7cd1b63789fc2756d115d493ec4d79add7e8edc7";
        hash = "sha256-bdDksqaZAqG/5URM3Ifb8DOvHvjwqqadN4eguWTN3Vk=";
      };
    };
  });
  meta = {
    description = "Wraps FMUs for co-simulation";
  };
})
