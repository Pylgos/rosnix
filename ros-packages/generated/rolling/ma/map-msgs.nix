{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "map_msgs";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ nav-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "map_msgs" = substituteSource {
        src = fetchgit {
          name = "map_msgs-source";
          url = "https://github.com/ros2-gbp/navigation_msgs-release.git";
          rev = "e8b77b13c76675dc8907ea9cda406140e6ab9329";
          hash = "sha256-Q/OE5g9D3e+mCr5txkE0Ipbd1c2MmAi/5WISTZXHyd0=";
        };
      };
    });
  };
  meta = {
    description = "This package defines messages commonly used in mapping packages.";
  };
})
