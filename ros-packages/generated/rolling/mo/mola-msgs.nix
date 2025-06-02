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
  version = "1.8.1-1";
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
        rev = "69c4b7b8ab65856ebc6222dc3e873d3d46a0c2b3";
        hash = "sha256-iSGr8v9dVj1G+ngnssnYhvKkHnaNUq8Rp6xJuD/OT/A=";
      };
    };
  });
  meta = {
    description = "ROS message, services, and actions used in other MOLA packages.";
  };
})
