{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-msgs,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_msgs";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."mola_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "mola_msgs" = substituteSource {
      src = fetchgit {
        name = "mola_msgs-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "fce05d8d1eaf69516c978c121db0421e9e32bdca";
        hash = "sha256-IpmXX5UMJYMcxgBnMDskNLWkFxTFkbX8BFrgv0lpLIU=";
      };
    };
  });
  meta = {
    description = "ROS message, services, and actions used in other MOLA packages.";
  };
})
