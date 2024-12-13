{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lely-core-libraries,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_fake_slaves";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_fake_slaves";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lely-core-libraries lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_fake_slaves" = substituteSource {
      src = fetchgit {
        name = "canopen_fake_slaves-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "7d8ad44d51f881c9a14c280f58bda643348d76c8";
        hash = "sha256-/J51LK/3aiNi928WbEdAGMMGFRjEURt/z2wttYTW/tk=";
      };
    };
  });
  meta = {
    description = "Package with mock canopen slave";
  };
})
