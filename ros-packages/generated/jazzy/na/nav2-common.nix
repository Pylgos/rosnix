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
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_common";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ launch launch-ros osrf-pycommon rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_common" = substituteSource {
      src = fetchgit {
        name = "nav2_common-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a5e4bd26962f825eaaf20fe9865eccdc5d3a374f";
        hash = "sha256-8L6FFbJCrbb01cUV0WBs5VsMAiDbn/dL8rKqj4uX9gg=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout the navigation 2 stack";
  };
})
