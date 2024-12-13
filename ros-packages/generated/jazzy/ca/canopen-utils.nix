{
  ament-lint-auto,
  buildAmentPythonPackage,
  canopen-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "canopen_utils";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_utils";
  propagatedBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_utils" = substituteSource {
      src = fetchgit {
        name = "canopen_utils-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "cce17436a954a6cc4f75083dd1e6e71265fcabf8";
        hash = "sha256-xjmDkjh2uqqyH/WIa718fRx3mXj/VETeYKrUYEZc1SE=";
      };
    };
  });
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
})
