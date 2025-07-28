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
  version = "2.2.3-1";
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
        rev = "3041cc1cea3530f29159f558c2576f77222c9348";
        hash = "sha256-Cyvk77Nvl+u4dPNj877zySlSOlqk2A+Y+L0YZVbGD8k=";
      };
    };
  });
  meta = {
    description = "Message, services, and actions, for other mrpt navigation packages.";
  };
})
