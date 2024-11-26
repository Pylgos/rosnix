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
  version = "0.2.12-2";
  src = finalAttrs.passthru.sources."canopen_utils";
  propagatedBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_utils" = substituteSource {
        src = fetchgit {
          name = "canopen_utils-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "c38bf3af55d34689708018eef16f7292184343a0";
          hash = "sha256-OfjICf9OLX/o1eunv9wPjJ8Z0vrkW4xHaUe7/B32hAA=";
        };
      };
    });
  };
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
})
