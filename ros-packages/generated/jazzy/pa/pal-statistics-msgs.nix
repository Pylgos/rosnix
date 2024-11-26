{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_statistics_msgs";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."pal_statistics_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "pal_statistics_msgs" = substituteSource {
        src = fetchgit {
          name = "pal_statistics_msgs-source";
          url = "https://github.com/ros2-gbp/pal_statistics-release.git";
          rev = "a766462b9dc9a379482a840a0449df3d5eddf899";
          hash = "sha256-X0WdtFtEDw9BHB7bbH7qV3N7dNVNJ+Ge6IyhxVeNpBY=";
        };
      };
    });
  };
  meta = {
    description = "Statistics msgs package";
  };
})
