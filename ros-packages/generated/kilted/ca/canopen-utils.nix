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
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."canopen_utils";
  propagatedNativeBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  propagatedBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_utils" = substituteSource {
      src = fetchgit {
        name = "canopen_utils-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "7ccbd462750a2d5db30da68810df38f094e20ffa";
        hash = "sha256-E4YDWXIcfR9fQ6QuM98frIdo5yrw5rOJaHfIwB6thao=";
      };
    };
  });
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
})
