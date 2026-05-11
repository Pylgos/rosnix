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
  version = "1.11.0-1";
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
        rev = "582887eab5b7b8d931e4d761bf249921ab842006";
        hash = "sha256-pgk8x14IRDIewU9Gcjkv/PvweG1AypnBHLcWS8VuPAY=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim messages.\n  ";
  };
})
