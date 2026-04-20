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
  version = "1.10.7-4";
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
        rev = "ccf9f0be77c13c14c044ce3d711ff361d3929d59";
        hash = "sha256-4jJ+KQPNphJjvlWNpDO2/rR5mFILBlHp315XmdQzRpg=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim messages.\n  ";
  };
})
