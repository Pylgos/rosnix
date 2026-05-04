{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros-testing,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle";
  version = "0.37.8-2";
  src = finalAttrs.passthru.sources."lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces lifecycle-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle" = substituteSource {
      src = fetchgit {
        name = "lifecycle-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "349014fa20df19c2b760ba712512e48a32e91d51";
        hash = "sha256-jUUUsZFjc+WOBllXzWX/mNrZHz4rY2yqlN3ObRREqqE=";
      };
    };
  });
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
})
