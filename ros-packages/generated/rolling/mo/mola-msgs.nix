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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."mola_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "mola_msgs" = substituteSource {
      src = fetchgit {
        name = "mola_msgs-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "58b1a4b55ace0eeff6ea60fe25598ff2bbd0c634";
        hash = "sha256-rCl6tMox6Ya20J/GiOqY0MkfjmNfAKixx77+eu8TX7M=";
      };
    };
  });
  meta = {
    description = "ROS message, services, and actions used in other MOLA packages.";
  };
})
