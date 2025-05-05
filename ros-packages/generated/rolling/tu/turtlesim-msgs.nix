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
  version = "1.10.0-1";
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
        rev = "329420f114189ae3ac7c6d812411abf25ae93ea0";
        hash = "sha256-7UiBplzeevw9qi7HEHBs8dTvIa4q8x6axwsGw/ulzFw=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim messages.\n  ";
  };
})
