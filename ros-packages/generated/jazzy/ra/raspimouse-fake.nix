{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_fake";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."raspimouse_fake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_fake" = substituteSource {
      src = fetchgit {
        name = "raspimouse_fake-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "d45b0d5bd89a979b875b733f0f80286ab3772740";
        hash = "sha256-mD7JiGVmSxrjLqHvnikSROtU+VUUr/7WpYrUwKSaKDg=";
      };
    };
  });
  meta = {
    description = "The raspimouse_control package";
  };
})
