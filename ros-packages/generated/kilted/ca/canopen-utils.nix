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
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."canopen_utils";
  propagatedNativeBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  propagatedBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_utils" = substituteSource {
      src = fetchgit {
        name = "canopen_utils-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "a8b7b7c393c4a403425f3c2be6580b35d526a233";
        hash = "sha256-JSZK5ylUW1LCseh3Z0KFyhO9UgX16mJ1HloE7vIWSX8=";
      };
    };
  });
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
})
