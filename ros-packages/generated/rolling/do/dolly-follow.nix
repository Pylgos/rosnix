{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dolly_follow";
  version = "0.4.0-5";
  src = finalAttrs.passthru.sources."dolly_follow";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dolly_follow" = substituteSource {
      src = fetchgit {
        name = "dolly_follow-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "7db99e14c778dbbdcac5f5eb4d6e3e732972764e";
        hash = "sha256-Udj2U+dWE5+JIz9GOSB6X4C9y3g/g30Jp3+BTuiiRX0=";
      };
    };
  });
  meta = {
    description = "\n    Follow node for Dolly, the robot sheep.\n  ";
  };
})
