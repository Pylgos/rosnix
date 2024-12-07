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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."autoware_map_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geographic-msgs geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_map_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_map_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "c28bd5b4f7103787137a5278956e98b9a22a9cf2";
        hash = "sha256-vVse0Kqjt5S8q0gcAr/9+Ai9a8rhMX0RIJGtgzdYegA=";
      };
    };
  });
  meta = {
    description = "Autoware map messages package.";
  };
})
