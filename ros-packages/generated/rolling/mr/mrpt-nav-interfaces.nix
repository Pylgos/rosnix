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
  version = "2.2.4-1";
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
        rev = "6ea73c7e9243ec93a01ec8aa34d43299085f5402";
        hash = "sha256-qBZqnV42Gl5LxYmqQEogW4BWaGTv8NB8Pq1y3jWIqmQ=";
      };
    };
  });
  meta = {
    description = "Message, services, and actions, for other mrpt navigation packages.";
  };
})
