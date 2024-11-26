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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."nav2_common";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ launch launch-ros osrf-pycommon rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_common" = substituteSource {
      src = fetchgit {
        name = "nav2_common-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "de44bb6a87fdf0bef3460aac550109e37a4dba53";
        hash = "sha256-5ZRyTPMltaH1RRFP64cnShDfK9EjsCcomibT2wRSDOE=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout the navigation 2 stack";
  };
})
