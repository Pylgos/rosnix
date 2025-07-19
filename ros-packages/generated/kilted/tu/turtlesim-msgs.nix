{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlesim_msgs";
  version = "1.9.3-1";
  src = finalAttrs.passthru.sources."turtlesim_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlesim_msgs" = substituteSource {
      src = fetchgit {
        name = "turtlesim_msgs-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "85eb66b4cd1e258107826b4926dd2dca6e2e240c";
        hash = "sha256-URWucMKuQ9P0y+x4prDECyrnBHSiEUMWP/WAOYHVPzQ=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim messages.\n  ";
  };
})
