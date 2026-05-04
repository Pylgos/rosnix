{
  ament-cmake-core,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  osrf-pycommon,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_common";
  version = "1.3.12-1";
  src = finalAttrs.passthru.sources."nav2_common";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-python launch launch-ros osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-python launch launch-ros osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_common" = substituteSource {
      src = fetchgit {
        name = "nav2_common-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a7ccc3b5f5a714afa8e41063c6028ddaeb21bfb5";
        hash = "sha256-XHqNN/NlkT0H7ndM6cyGutFrK6u3OsNDi1vmnucWg0U=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout the navigation 2 stack";
  };
})
