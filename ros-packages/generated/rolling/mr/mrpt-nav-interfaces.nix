{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mrpt-msgs,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_nav_interfaces";
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."mrpt_nav_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs geometry-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_nav_interfaces" = substituteSource {
      src = fetchgit {
        name = "mrpt_nav_interfaces-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "5b8999b07cb8fa088f2f32a98028e9f8f5d3f53c";
        hash = "sha256-yiPtyF6jMUqpmSBa4Gz/SQwsWzDWBR5cgUYPdF0rpq0=";
      };
    };
  });
  meta = {
    description = "Message, services, and actions, for other mrpt navigation packages.";
  };
})
