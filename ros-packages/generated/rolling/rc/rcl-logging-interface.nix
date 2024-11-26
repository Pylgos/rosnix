{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_interface";
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."rcl_logging_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common rcpputils ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcl_logging_interface" = substituteSource {
        src = fetchgit {
          name = "rcl_logging_interface-source";
          url = "https://github.com/ros2-gbp/rcl_logging-release.git";
          rev = "eef818957b98c74cbc0edead0bacc0a9a6e6ab6d";
          hash = "sha256-SoGD/S4PjbOXPz762FPvwxttYxcKmVUWk816bmY6QU8=";
        };
      };
    });
  };
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
})
