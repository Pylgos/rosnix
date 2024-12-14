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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_common";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ launch launch-ros osrf-pycommon rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_common" = substituteSource {
      src = fetchgit {
        name = "nav2_common-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a8386fc923725a31416e924c4bd66c15db3efaad";
        hash = "sha256-iSUCjEE42aIcURFoemG3y7HiUrbW/3ejAeI/W6VW6fc=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout the navigation 2 stack";
  };
})
