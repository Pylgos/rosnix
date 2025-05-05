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
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_common";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-python rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ launch launch-ros osrf-pycommon ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_common" = substituteSource {
      src = fetchgit {
        name = "nav2_common-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "64c659595d569df3fad065f88e638abd9bb322ec";
        hash = "sha256-R7Zjy3tdRtCsA88vyKl08zYqfK+JXuHfXf8RhkFG3+A=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout the navigation 2 stack";
  };
})
