{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle";
  version = "0.36.3-1";
  src = finalAttrs.passthru.sources."lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle" = substituteSource {
      src = fetchgit {
        name = "lifecycle-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "588dd8b3fb4a45ca11da9b7c3443916659726801";
        hash = "sha256-SIJlMbTIbsrfTu0EvPtnT+e/SyCNrwQXA0j9boAN7xM=";
      };
    };
  });
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
})
