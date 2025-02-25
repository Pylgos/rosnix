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
  version = "1.6.2-1";
  src = finalAttrs.passthru.sources."mola_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "mola_msgs" = substituteSource {
      src = fetchgit {
        name = "mola_msgs-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "21715e6b9516b8bbbf5b9fe47c784d34a62cd609";
        hash = "sha256-ggkXVNAcR1sFdeVCQ3wbso1W4M4WmO3WdrES7Zf5TRI=";
      };
    };
  });
  meta = {
    description = "ROS message, services, and actions used in other MOLA packages.";
  };
})
