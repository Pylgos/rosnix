{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_map_msgs";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."autoware_map_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geographic-msgs geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geographic-msgs geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_map_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_map_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "9659b7a537f3dbd9ae83ba92e739f023a39eaa4b";
        hash = "sha256-cUU0qjhffrJvkUYdoLI1sWjvqgLvxDffO1mfWHMnSAI=";
      };
    };
  });
  meta = {
    description = "Autoware map messages package.";
  };
})
