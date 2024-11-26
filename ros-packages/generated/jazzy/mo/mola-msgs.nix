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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_msgs" = substituteSource {
        src = fetchgit {
          name = "mola_msgs-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "246bbf1f02e03b70d18ceb726fb79341fd07619b";
          hash = "sha256-9isc80J2uT6tvqAcT9WfHVGCP+2ChANVfDtwmDysJsY=";
        };
      };
    });
  };
  meta = {
    description = "ROS message, services, and actions used in other MOLA packages.";
  };
})
