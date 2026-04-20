{
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_core_decoders";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_core_decoders";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libpng++-dev" "libpng-dev" ]; };
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libpng++-dev" "libpng-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_core_decoders" = substituteSource {
      src = fetchgit {
        name = "nebula_core_decoders-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "bce4d690bf93b7218b38df07af430822f4e63bbc";
        hash = "sha256-yUEb+ELFZtWHrUWcsqkodNtQLkJDYMaHK0TKVfuXj/M=";
      };
    };
  });
  meta = {
    description = "Nebula Decoders Base Library";
  };
})
