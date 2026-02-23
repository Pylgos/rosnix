{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lightning_rrt_interfaces";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."lightning_rrt_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lightning_rrt_interfaces" = substituteSource {
      src = fetchgit {
        name = "lightning_rrt_interfaces-source";
        url = "https://github.com/david-dorf/lightning_rrt_interfaces.git";
        rev = "d5619e1d6035328e99cb7ceb8d2eebfc5a17a321";
        hash = "sha256-RsDLpDkGqJX6jrS1m/jzHQ6WlZo/hshhyn02hpLWe7Y=";
      };
    };
  });
  meta = {
    description = "Lightning fast RRT path planner interfaces";
  };
})
