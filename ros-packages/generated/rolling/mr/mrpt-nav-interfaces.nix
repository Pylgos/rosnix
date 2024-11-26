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
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."mrpt_nav_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs geometry-msgs mrpt-msgs nav-msgs rosidl-default-runtime ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_nav_interfaces" = substituteSource {
        src = fetchgit {
          name = "mrpt_nav_interfaces-source";
          url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
          rev = "4810398789d4d7f8bc4649fd0fc1675da8853eb9";
          hash = "sha256-8KTKjf4wojCWJyyCLAjYtgfTkudf2BASMVhT9gy9+1M=";
        };
      };
    });
  };
  meta = {
    description = "Message, services, and actions, for other mrpt navigation packages.";
  };
})
