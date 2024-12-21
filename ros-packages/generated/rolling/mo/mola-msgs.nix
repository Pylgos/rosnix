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
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."mola_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "mola_msgs" = substituteSource {
      src = fetchgit {
        name = "mola_msgs-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "1155a98000ab40dbe6929916bb827b0895a2c7a4";
        hash = "sha256-GOld5ShtqPfuSHWst5tSRDr87bfmGt9POn0AzuBZETc=";
      };
    };
  });
  meta = {
    description = "ROS message, services, and actions used in other MOLA packages.";
  };
})
